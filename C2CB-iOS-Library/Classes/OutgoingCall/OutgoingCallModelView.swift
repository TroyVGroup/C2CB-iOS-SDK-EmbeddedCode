//
//  OutgoingCallModelView.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 22/12/23.
//

import UIKit
import AVFoundation
//import PushKit
//import CallKit
import TwilioVoice
open class OutgoingCallModelView{
    var outgoingView:OutgoingCallUISetup?
    func startcalling(){
        guard CallHandler.shared.activeCall == nil else {
            CallHandler.shared.userInitiatedDisconnect = true
            CallHandler.shared.performEndCallAction(uuid: CallHandler.shared.activeCall!.uuid!)
           // toggleUIState(isEnabled: false, showCallControl: false)
            
            return
        }
        
        checkRecordPermission { [weak self] permissionGranted in
            let uuid = UUID()
            let handle = "+919304712071"
            
            guard !permissionGranted else {
                CallHandler.shared.performStartCallAction(uuid: uuid, handle: handle)
                return
            }
        
            self?.showMicrophoneAccessRequest(uuid, handle)
        }
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
    
    func showMicrophoneAccessRequest(_ uuid: UUID, _ handle: String) {
        let alertController = UIAlertController(title: "Voice Quick Start",
                                                message: "Microphone permission not granted",
                                                preferredStyle: .alert)
        
        let continueWithoutMic = UIAlertAction(title: "Continue without microphone", style: .default) {  _ in
            CallHandler.shared.performStartCallAction(uuid: uuid, handle: handle)
        }
        
        let goToSettings = UIAlertAction(title: "Settings", style: .default) { _ in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!,
                                      options: [UIApplication.OpenExternalURLOptionsKey.universalLinksOnly: false],
                                      completionHandler: nil)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { [weak self] _ in
           // self?.toggleUIState(isEnabled: true, showCallControl: false)
            //self?.stopSpin()
            self?.outgoingView?.dismiss(animated: true)
        }
        
        [continueWithoutMic, goToSettings, cancel].forEach { alertController.addAction($0) }
        
        outgoingView?.present(alertController, animated: true, completion: nil)
    }
    
    
    func timeString(time:TimeInterval) -> String {
        
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
       let seconds = Int(time) % 60
       return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    
    func toggleAudioRoute(toSpeaker: Bool) {
        // The mode set by the Voice SDK is "VoiceChat" so the default audio route is the built-in receiver. Use port override to switch the route.
        CallHandler.shared.audioDevice.block = {
            DefaultAudioDevice.DefaultAVAudioSessionConfigurationBlock()
            
            do {
                if toSpeaker {
                    try AVAudioSession.sharedInstance().overrideOutputAudioPort(.speaker)
                } else {
                    try AVAudioSession.sharedInstance().overrideOutputAudioPort(.none)
                }
            } catch {
                NSLog(error.localizedDescription)
            }
        }
        CallHandler.shared.audioDevice.block()
    }
    
    //MARK: - Cancel the Call
    
    func cancelTheCall(token_id:String){
        let param = [ApiParaKey.cancel_Call.Token : token_id] as! EIDictonary
        print("send_EmailAddressAPI_param>>>>",param)
        API.post(Endpoint: .call_cancel, parameter: param,completion: {
            (response , error) in
                if let error = error{
                    print("Error",error)
                    showAlert(title: "Error", message: error, view: self.outgoingView ?? UIViewController())
                    return
                }
            if let status = response?["status"] as? NSNumber{
                if status == 200{
                    DispatchQueue.main.async {
                        print("Response>>>>>",response!)
                        CallHandler.shared.audioDevice.isEnabled = false
                        if (CallHandler.shared.activeCall != nil && CallHandler.shared.activeCall?.state == .connected) {
                            CallHandler.shared.activeCall?.disconnect()
                        }
                        UserDefaults.standard.removeObject(forKey: "verified_mobile_no")
                        UserDefaults.standard.removeObject(forKey: "call_ext")
                        UserDefaults.standard.removeObject(forKey: "call_id")
                        UserDefaults.standard.removeObject(forKey: "call_token")
                        
                        if let invite = CallHandler.shared.activeCallInvites[CallHandler.shared.activeCall?.uuid?.uuidString ?? ""] {
                            invite.reject()
                            CallHandler.shared.activeCallInvites.removeValue(forKey: CallHandler.shared.activeCall?.uuid?.uuidString ?? "")
                        } else if let call = CallHandler.shared.activeCalls[CallHandler.shared.activeCall?.uuid?.uuidString ?? ""] {
                            call.disconnect()
                        } else {
                            self.outgoingView?.dismiss(animated: true)
                        }
                        self.outgoingView?.timer?.invalidate()
                        self.outgoingView?.dismiss(animated: true)
                        
                    }
                }
            }
        })
        
    }
}
