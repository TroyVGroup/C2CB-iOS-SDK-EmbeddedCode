//
//  CallHandle.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 22/12/23.
//

import UIKit
import AVFoundation
import PushKit
import CallKit
import TwilioVoice

//let accessToken = "eyJjdHkiOiJ0d2lsaW8tZnBhO3Y9MSIsInR5cCI6IkpXVCIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJTSzhlYWU3YjhiNTllNGNmYjk1NGIxNDMzMDk2MGQxNmRjIiwiZXhwIjoxNzAzNTc4NzE0LCJncmFudHMiOnsidm9pY2UiOnsiaW5jb21pbmciOnsiYWxsb3ciOmZhbHNlfSwib3V0Z29pbmciOnsiYXBwbGljYXRpb25fc2lkIjoiQVAzM2IxOTczM2Q4MmRiODE2YTJjMjk1NGFkZjY5M2E2ZiJ9fSwiaWRlbnRpdHkiOiJ1c2VyIn0sImp0aSI6IlNLOGVhZTdiOGI1OWU0Y2ZiOTU0YjE0MzMwOTYwZDE2ZGMtMTcwMzU3NTE2OCIsInN1YiI6IkFDMTRlYWQ2ZmYyNDk4YjMzYzdhZGQ0MmYyODMzMzZkMDQifQ.V4W64wuuNj2xwpJEft8JKRQMsBeMOOUzIFQ0BJE9IBU"

let kRegistrationTTLInDays = 365

let kCachedDeviceToken = "CachedDeviceToken"
let kCachedBindingDate = "CachedBindingDate"

open class CallHandler:NSObject{

    var incomingPushCompletionCallback: (() -> Void)?

    var isSpinning: Bool?
    var incomingAlertController: UIAlertController?

    var callKitCompletionCallback: ((Bool) -> Void)? = nil
    var audioDevice = DefaultAudioDevice()
    var activeCallInvites: [String: CallInvite]! = [:]
    var activeCalls: [String: Call]! = [:]
    
    // activeCall represents the last connected call
    var activeCall: Call? = nil

    var callKitProvider: CXProvider?
    let callKitCallController = CXCallController()
    var userInitiatedDisconnect: Bool = false
    
    /*
     Custom ringback will be played when this flag is enabled.
     When [answerOnBridge](https://www.twilio.com/docs/voice/twiml/dial#answeronbridge) is enabled in
     the <Dial> TwiML verb, the caller will not hear the ringback while the call is ringing and awaiting
     to be accepted on the callee's side. Configure this flag based on the TwiML application.
    */
    var playCustomRingback = false
    var ringtonePlayer: AVAudioPlayer? = nil

    deinit {
        // CallKit has an odd API contract where the developer must call invalidate or the CXProvider is leaked.
        if let provider = callKitProvider {
            provider.invalidate()
        }
    }
    
    static var shared: CallHandler = {
            let object = CallHandler.init()
            return object
        }()
    
    func callkit(){
        /* Please note that the designated initializer `CXProviderConfiguration(localizedName: String)` has been deprecated on iOS 14. */
        let configuration = CXProviderConfiguration(localizedName: "Voice Quickstart")
        configuration.maximumCallGroups = 5
        configuration.maximumCallsPerCallGroup = 10
        configuration.includesCallsInRecents = false;
        configuration.supportedHandleTypes = [.phoneNumber]
        callKitProvider = CXProvider(configuration: configuration)
        if let provider = callKitProvider {
            provider.setDelegate(self, queue: nil)
        }
        TwilioVoiceSDK.audioDevice = audioDevice
    }

    

    
    func checkRecordPermission(completion: @escaping (_ permissionGranted: Bool) -> Void) {
        let permissionStatus = AVAudioSession.sharedInstance().recordPermission
        
        switch permissionStatus {
        case .granted:
            // Record permission already granted.
            completion(true)
        case .denied:
            // Record permission denied.
            completion(false)
        case .undetermined:
            // Requesting record permission.
            // Optional: pop up app dialog to let the users know if they want to request.
            AVAudioSession.sharedInstance().requestRecordPermission { granted in completion(granted) }
        default:
            completion(false)
        }
    }
    
}

// MARK: - TVONotificaitonDelegate

extension CallHandler: NotificationDelegate {
    public func callInviteReceived(callInvite: CallInvite) {
        NSLog("callInviteReceived:")
        
        /**
         * The TTL of a registration is 1 year. The TTL for registration for this device/identity
         * pair is reset to 1 year whenever a new registration occurs or a push notification is
         * sent to this device/identity pair.
         */
        UserDefaults.standard.set(Date(), forKey: kCachedBindingDate)
        
        let callerInfo: TVOCallerInfo = callInvite.callerInfo
        if let verified: NSNumber = callerInfo.verified {
            if verified.boolValue {
                NSLog("Call invite received from verified caller number!")
            }
        }
        
       // let from = (callInvite.from ?? "Voice Bot").replacingOccurrences(of: "client:", with: "")

        activeCallInvites[callInvite.uuid.uuidString] = callInvite
    }
    
    public func cancelledCallInviteReceived(cancelledCallInvite: CancelledCallInvite, error: Error) {
        NSLog("cancelledCallInviteCanceled:error:, error: \(error.localizedDescription)")

        guard let activeCallInvites = activeCallInvites, !activeCallInvites.isEmpty else {
            NSLog("No pending call invite")
            return
        }
        
        let callInvite = activeCallInvites.values.first { invite in invite.callSid == cancelledCallInvite.callSid }
        
        if let callInvite = callInvite {
            performEndCallAction(uuid: callInvite.uuid)
            //self.activeCallInvites.removeValue(forKey: callInvite.uuid.uuidString)
        }
    }
}


// MARK: - TVOCallDelegate

extension CallHandler: CallDelegate {
    public func callDidStartRinging(call: Call) {
        NSLog("callDidStartRinging:")
        
       // placeCallButton.setTitle("Ringing", for: .normal)
        
        /*
         When [answerOnBridge](https://www.twilio.com/docs/voice/twiml/dial#answeronbridge) is enabled in the
         <Dial> TwiML verb, the caller will not hear the ringback while the call is ringing and awaiting to be
         accepted on the callee's side. The application can use the `AVAudioPlayer` to play custom audio files
         between the `[TVOCallDelegate callDidStartRinging:]` and the `[TVOCallDelegate callDidConnect:]` callbacks.
        */
        if playCustomRingback {
            playRingback()
        }
    }
    
    public func callDidConnect(call: Call) {
        NSLog("callDidConnect:")
        NSLog("444444444:")
        if playCustomRingback {
            stopRingback()
        }

        if let callKitCompletionCallback = callKitCompletionCallback {
            callKitCompletionCallback(true)
        }
    }
    
    public func call(call: Call, isReconnectingWithError error: Error) {
        NSLog("call:isReconnectingWithError:")
        
       // placeCallButton.setTitle("Reconnecting", for: .normal)
    }
    
    public func callDidReconnect(call: Call) {
        NSLog("callDidReconnect:")
        
       // placeCallButton.setTitle("Hang Up", for: .normal)
    }
    
    public  func callDidFailToConnect(call: Call, error: Error) {
        NSLog("Call failed to connect: \(error.localizedDescription)")
        
        if let completion = callKitCompletionCallback {
            completion(false)
        }
        
        if let provider = callKitProvider {
            provider.reportCall(with: call.uuid!, endedAt: Date(), reason: CXCallEndedReason.failed)
        }

        callDisconnected(call: call)
    }
    
    public func callDidDisconnect(call: Call, error: Error?) {
        if let error = error {
            NSLog("Call failed: \(error.localizedDescription)")
        } else {
            NSLog("Call disconnected")
            //performEndCallAction(uuid: call.uuid!)
            if (activeCall != nil && activeCall?.state == .connected) {
                activeCall?.disconnect()
            }

            if let invite = activeCallInvites[call.uuid?.uuidString ?? ""] {
                invite.reject()
                activeCallInvites.removeValue(forKey: call.uuid?.uuidString ?? "")
            } else if let call = activeCalls[call.uuid?.uuidString ?? ""] {
                call.disconnect()
            } else {
                NSLog("Unknown UUID to perform end-call action with")
            }
            //NotificationCenter.default.post(name:NSNotification.Name("call_disconnect"),object: nil)
            //activeCall?.disconnect()
            performEndCallAction(uuid: call.uuid!)
           
         
        }
        
        if !userInitiatedDisconnect {
            var reason = CXCallEndedReason.remoteEnded
            
            if error != nil {
                reason = .failed
            }
            
            if let provider = callKitProvider {
                provider.reportCall(with: call.uuid!, endedAt: Date(), reason: reason)
            }
        }

        callDisconnected(call: call)
    }
    
    public func callDisconnected(call: Call) {
        if call == activeCall {
            activeCall = nil
        }
        
        activeCalls.removeValue(forKey: call.uuid!.uuidString)
        
        userInitiatedDisconnect = false
        
        if playCustomRingback {
            stopRingback()
        }
       // placeCallButton.setTitle("Call", for: .normal)
    }
    
    public func callDidReceiveQualityWarnings(call: Call, currentWarnings: Set<NSNumber>, previousWarnings: Set<NSNumber>) {
        /**
        * currentWarnings: existing quality warnings that have not been cleared yet
        * previousWarnings: last set of warnings prior to receiving this callback
        *
        * Example:
        *   - currentWarnings: { A, B }
        *   - previousWarnings: { B, C }
        *   - intersection: { B }
        *
        * Newly raised warnings = currentWarnings - intersection = { A }
        * Newly cleared warnings = previousWarnings - intersection = { C }
        */
        var warningsIntersection: Set<NSNumber> = currentWarnings
        warningsIntersection = warningsIntersection.intersection(previousWarnings)
        
        var newWarnings: Set<NSNumber> = currentWarnings
        newWarnings.subtract(warningsIntersection)
        if newWarnings.count > 0 {
            qualityWarningsUpdatePopup(newWarnings, isCleared: false)
        }
        
        var clearedWarnings: Set<NSNumber> = previousWarnings
        clearedWarnings.subtract(warningsIntersection)
        if clearedWarnings.count > 0 {
            qualityWarningsUpdatePopup(clearedWarnings, isCleared: true)
        }
    }
    
   public func qualityWarningsUpdatePopup(_ warnings: Set<NSNumber>, isCleared: Bool) {
        NSLog("1111111111111111111111111111111:")
        var popupMessage: String = "Warnings detected: "
        if isCleared {
            popupMessage = "Warnings cleared: "
        }

        let mappedWarnings: [String] = warnings.map { number in warningString(Call.QualityWarning(rawValue: number.uintValue)!)}
        popupMessage += mappedWarnings.joined(separator: ", ")
        print("popupMessage",popupMessage)
       // qualityWarningsToaster.alpha = 0.0
        //qualityWarningsToaster.text = popupMessage
        UIView.animate(withDuration: 1.0, animations: {
           // self.qualityWarningsToaster.isHidden = false
           // self.qualityWarningsToaster.alpha = 1.0
        }) { finish in
            //guard let strongSelf = self else { return }
            let deadlineTime = DispatchTime.now() + .seconds(5)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
                UIView.animate(withDuration: 1.0, animations: {
                   // strongSelf.qualityWarningsToaster.alpha = 0.0
                }) { (finished) in
                   // strongSelf.qualityWarningsToaster.isHidden = true
                }
            })
        }
    }
    
    public func warningString(_ warning: Call.QualityWarning) -> String {
        switch warning {
        case .highRtt: return "high-rtt"
        case .highJitter: return "high-jitter"
        case .highPacketsLostFraction: return "high-packets-lost-fraction"
        case .lowMos: return "low-mos"
        case .constantAudioInputLevel: return "constant-audio-input-level"
        default: return "Unknown warning"
        }
    }
    
    
    // MARK: Ringtone
    
    public func playRingback() {
        let ringtonePath = URL(fileURLWithPath: Bundle.main.path(forResource: "ringtone", ofType: "wav")!)
        
        do {
            ringtonePlayer = try AVAudioPlayer(contentsOf: ringtonePath)
            ringtonePlayer?.delegate = self
            ringtonePlayer?.numberOfLoops = -1
            
            ringtonePlayer?.volume = 1.0
            ringtonePlayer?.play()
        } catch {
            NSLog("Failed to initialize audio player")
        }
    }
    
    public func stopRingback() {
        guard let ringtonePlayer = ringtonePlayer, ringtonePlayer.isPlaying else { return }
        
        ringtonePlayer.stop()
    }
}

 
// MARK: - CXProviderDelegate

extension CallHandler: CXProviderDelegate {
    public func providerDidReset(_ provider: CXProvider) {
        NSLog("providerDidReset:")
        audioDevice.isEnabled = false
    }

    public func providerDidBegin(_ provider: CXProvider) {
        NSLog("providerDidBegin")
    }

    public func provider(_ provider: CXProvider, didActivate audioSession: AVAudioSession) {
        NSLog("provider:didActivateAudioSession:")
        audioDevice.isEnabled = true
    }

    public func provider(_ provider: CXProvider, didDeactivate audioSession: AVAudioSession) {
        NSLog("provider:didDeactivateAudioSession:")
        audioDevice.isEnabled = false
        if (activeCall != nil && activeCall?.state == .connected) {
            activeCall?.disconnect()
        }
        
        if let invite = activeCallInvites[activeCall?.uuid?.uuidString ?? ""] {
            invite.reject()
            activeCallInvites.removeValue(forKey: activeCall?.uuid?.uuidString ?? "")
        } else if let call = activeCalls[activeCall?.uuid?.uuidString ?? ""] {
            call.disconnect()
        } else {
            NSLog("Unknown UUID to perform end-call action with12345")
        }
        NotificationCenter.default.post(name:NSNotification.Name("call_disconnect"),object: nil)
    }

    public func provider(_ provider: CXProvider, timedOutPerforming action: CXAction) {
        NSLog("provider:timedOutPerformingAction:")
    }

    public func provider(_ provider: CXProvider, perform action: CXStartCallAction) {
        NSLog("provider:performStartCallAction:")
        
        
        provider.reportOutgoingCall(with: action.callUUID, startedConnectingAt: Date())
        
        performVoiceCall(uuid: action.callUUID, client: "") { success in
            if success {
                NSLog("performVoiceCall() successful")
                provider.reportOutgoingCall(with: action.callUUID, connectedAt: Date())
            } else {
                NSLog("performVoiceCall() failed")
            }
        }
        
        action.fulfill()
    }

    

    public func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        NSLog("provider:performEndCallAction:")
        
        if let invite = activeCallInvites[action.callUUID.uuidString] {
            invite.reject()
            activeCallInvites.removeValue(forKey: action.callUUID.uuidString)
        } else if let call = activeCalls[action.callUUID.uuidString] {
            call.disconnect()
        } else {
            NSLog("Unknown UUID to perform end-call action with")
        }

        action.fulfill()
    }
    
    public func provider(_ provider: CXProvider, perform action: CXSetHeldCallAction) {
        NSLog("provider:performSetHeldAction:")
        
        if let call = activeCalls[action.callUUID.uuidString] {
            call.isOnHold = action.isOnHold
            action.fulfill()
        } else {
            action.fail()
        }
    }
    
    public func provider(_ provider: CXProvider, perform action: CXSetMutedCallAction) {
        NSLog("provider:performSetMutedAction:")

        if let call = activeCalls[action.callUUID.uuidString] {
            call.isMuted = action.isMuted
            action.fulfill()
        } else {
            action.fail()
        }
    }

    
    // MARK: Call Kit Actions
    func performStartCallAction(uuid: UUID, handle: String) {
        guard let provider = callKitProvider else {
            NSLog("CallKit provider not available")
            return
        }
        
        let callHandle = CXHandle(type: .generic, value: handle)
        let startCallAction = CXStartCallAction(call: uuid, handle: callHandle)
        let transaction = CXTransaction(action: startCallAction)

        callKitCallController.request(transaction) { error in
            if let error = error {
                NSLog("StartCallAction transaction request failed: \(error.localizedDescription)")
                return
            }

            NSLog("StartCallAction transaction request successful")

            let callUpdate = CXCallUpdate()
            
            callUpdate.remoteHandle = callHandle
            callUpdate.supportsDTMF = true
            callUpdate.supportsHolding = true
            callUpdate.supportsGrouping = false
            callUpdate.supportsUngrouping = false
            callUpdate.hasVideo = false

            provider.reportCall(with: uuid, updated: callUpdate)
        }
    }

   

    func performEndCallAction(uuid: UUID) {

        let endCallAction = CXEndCallAction(call: uuid)
        let transaction = CXTransaction(action: endCallAction)

        callKitCallController.request(transaction) { error in
            if let error = error {
                NSLog("EndCallAction transaction request failed: \(error.localizedDescription).")
                if let callKitError = error as? CXError {
                        print("CallKit error code: \(callKitError.code.rawValue)")
                }
            self.callKitProvider?.reportCall(with:  endCallAction.uuid, endedAt: nil, reason: CXCallEndedReason.remoteEnded)
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else {return}
                    print(#function)
                    let call = self.activeCalls[uuid.uuidString]
                    call?.disconnect()
                    self.activeCall = nil
                    NotificationCenter.default.post(name:NSNotification.Name("call_disconnect"),object: nil)
                   
                }
            } else {
                NSLog("EndCallAction transaction request successful")
                self.activeCall = nil
                let call = self.activeCalls[uuid.uuidString]
                call?.disconnect()
            }
        }
    }
    
    func performVoiceCall(uuid: UUID, client: String?, completionHandler: @escaping (Bool) -> Void) {
        NSLog("nnnnnnnnnnnnn:")
        let accessToken = UserDefaults.standard.object(forKey: "call_token") as? String
        let accessToken_id = UserDefaults.standard.object(forKey: "call_id") as? String
        let mobile_no = UserDefaults.standard.object(forKey: "verified_mobile_no") as? String
        print("access_token",accessToken ?? "")
        print("twilionumber",mobile_no ?? "")
        let param = ["To":mobile_no ?? "" ,"Token":accessToken_id ?? ""]
        print("param",param)
        let connectOptions = ConnectOptions(accessToken: accessToken ?? "") { builder in
            builder.params = param
            builder.uuid = uuid
        }
        print("performVoiceCallOut")
        let call = TwilioVoiceSDK.connect(options: connectOptions, delegate: self)
        activeCall = call
        activeCalls[call.uuid!.uuidString] = call
        callKitCompletionCallback = completionHandler
    }
    
}


// MARK: - AVAudioPlayerDelegate

extension CallHandler: AVAudioPlayerDelegate {
    public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            NSLog("Audio player finished playing successfully");
        } else {
            NSLog("Audio player finished playing with some error");
        }
    }
    
    public func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        if let error = error {
            NSLog("Decode error occurred: \(error.localizedDescription)")
        }
    }
}
