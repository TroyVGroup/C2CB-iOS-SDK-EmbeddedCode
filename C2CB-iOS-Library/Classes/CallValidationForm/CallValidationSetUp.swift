//
//  CallValidationSetUp.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 12/12/23.
//

import Foundation
open class CallValidationSetUp:BaseViewController{
    
    let callModel = CallValidationModel()
    var country_code:String = ""
    open override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            call_messageTextView.textColor = UIColor.label
        } else {
            call_messageTextView.textColor = .black
        }
        cancelButton.addTarget(self, action: #selector(dismissSubView), for: .touchUpInside)
        countrySelectedButton.addTarget(self, action: #selector(actionOnSelectedCountryCodeBtn), for: .touchUpInside)
        
        contactCodeBtn.addTarget(self, action: #selector(actionOnContactCodeVerifyBtn), for: .touchUpInside)
        emailVerifyBtn.addTarget(self, action: #selector(actionOnEmailCodeVerifyBtn), for: .touchUpInside)
        
        checkBoxBtn.addTarget(self, action: #selector(actionOnCheckBoxBtn), for: .touchUpInside)
        termsAndConditonBtn.addTarget(self, action: #selector(actionOnTermsAndConditionsBtn), for: .touchUpInside)
        
        connectButton.addTarget(self, action: #selector(actionOnConnectBtn), for: .touchUpInside)
        contextToCallBtn.addTarget(self, action: #selector(actionOnContextToCallBtn), for: .touchUpInside)
        
        
        call_messageTextView.delegate = self
        mobileVerificationCodeText.delegate = self
        emailVerificationCodeText.delegate = self
        call_messageTextView.text = placeholderMess
        callModel.callView = self
        doneKeyboard(dismissOnTap: true)
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpCall_ValidationPage()
    }
    
}
extension CallValidationSetUp{
    
    @IBAction private func dismissSubView(){
        dismiss(animated: true)
        countdownTimer?.invalidate() // Stop the timer
        print("Call_dismissSubView")
        
    }
    
    @IBAction private func actionOnSelectedCountryCodeBtn(){
        print("Call_actionOnSelectedCountryCodeBtn")
        if var topViewController = UIApplication.shared.windows.first?.rootViewController {
            while let presentedViewController = topViewController.presentedViewController {
                topViewController = presentedViewController
            }

            // Now, topViewController is the topmost view controller
            let countryCodeViewController = CountryCodeViewController()
            countryCodeViewController.countryDetails = self
            topViewController.present(countryCodeViewController, animated: true, completion: nil)
        }

    }
    
    @IBAction private func actionOnContactCodeVerifyBtn(){
        print("Email_actionOnContactCodeVerifyBtn")
        if callModel.mobileOTPValidation(){
            let channel_id = UserDefaults.standard.value(forKey: "channel_id") as? String
            print("country_code",country_code)
            self.contactCodeBtn.isEnabled = false
            call_secondsRemaining = 60
            self.countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateContactCountdown), userInfo: nil, repeats: true)
            sendOtpByContactNo(channel_id: channel_id ?? "", contact_no: mobileText.text!, country_code: country_code)
        }
    }
    @objc func updateContactCountdown() {
            // Update the countdown
        call_secondsRemaining -= 1
            
            // Update the button title
            updateContactCodeBtnTitle()
            
            // Check if the countdown is complete
            if call_secondsRemaining == 0 {
                countdownTimer?.invalidate() // Stop the timer
                contactCodeBtn.isEnabled = true
                contactCodeBtn.setTitle("Code", for: .normal)
                call_secondsRemaining = 60
            }
        }

        func updateContactCodeBtnTitle() {
            // Update the button title with the current countdown value
            contactCodeBtn.setTitle("\(call_secondsRemaining)", for: .normal)
        }
    
    @IBAction private func actionOnEmailCodeVerifyBtn(){
        print("Email_actionOnEmailCodeVerifyBtn")
        if callModel.emailOTPValidation(){
            let channel_id = UserDefaults.standard.value(forKey: "channel_id") as? String
            print("country_code",country_code)
            self.emailVerifyBtn.isEnabled = false
            email_secondsRemaining = 60
            self.countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateEmailCountdown), userInfo: nil, repeats: true)
            sendOtpByEmailAddress(channel_id: channel_id ?? "", email_id: emailText.text!)
        }
    }
    @objc func updateEmailCountdown() {
            // Update the countdown
        email_secondsRemaining -= 1
            
            // Update the button title
            updateEmailCodeBtnTitle()
            
            // Check if the countdown is complete
            if email_secondsRemaining == 0 {
                countdownTimer?.invalidate() // Stop the timer
                emailVerifyBtn.isEnabled = true
                emailVerifyBtn.setTitle("Verify", for: .normal)
                email_secondsRemaining = 60
            }
        }

        func updateEmailCodeBtnTitle() {
            // Update the button title with the current countdown value
            emailVerifyBtn.setTitle("\(email_secondsRemaining)", for: .normal)
        }
    
    
    @IBAction private func actionOnCheckBoxBtn(){
        print("Call_actionOnCheckBoxBtn")
        checkBoxBtn.isSelected = !checkBoxBtn.isSelected

        if checkBoxBtn.isSelected {
            //checkBoxBtn.setImage(UIImage(named: "checkedImage"), for: .normal)
            let image = Constant.getImage(named: "checked")?.withRenderingMode(.alwaysOriginal)
            checkBoxBtn.setImage(image, for: .normal)
            checkBoxBtn.contentMode = .scaleAspectFit
            checkBoxBtn.tintColor = .clear
            temp_variable = 1
            connectButton.isUserInteractionEnabled = true
            // Handle the checked state
        } else {
            //checkBoxBtn.setImage(UIImage(named: "uncheckedImage"), for: .normal)
            let image = Constant.getImage(named: "unChecked")?.withRenderingMode(.alwaysOriginal)
            checkBoxBtn.setImage(image, for: .normal)
            checkBoxBtn.contentMode = .scaleAspectFit
            checkBoxBtn.tintColor = .clear
            temp_variable = 0
            connectButton.isUserInteractionEnabled = false
            // Handle the unchecked state
        }
        
    }
    
    @IBAction private func actionOnTermsAndConditionsBtn(){
        print("Call_actionOnTermsAndConditionsBtn")
        if var topViewController = UIApplication.shared.windows.first?.rootViewController {
            while let presentedViewController = topViewController.presentedViewController {
                topViewController = presentedViewController
            }

            // Now, topViewController is the topmost view controller
            let webpage = CustomWebViewPage()
            webpage.url_value = WebService.termConditionUrl.rawValue
            topViewController.present(webpage, animated: true, completion: nil)
        }
       
    }
    
    @IBAction private func actionOnConnectBtn(){
        print("Call_actionOnConnectBtn")

        if temp_variable == 1
        {
            if callModel.validation(){
                print("Validated....")
                let channel_id = UserDefaults.standard.value(forKey: "channel_id") as? String
                    callModel.initial_callAPiCalling(channel_id:channel_id ?? "")
            }
        }
        
        // open outgoing page
//        dismiss(animated: true,completion: {
//
//
//        if var topViewController = UIApplication.shared.windows.first?.rootViewController {
//            while let presentedViewController = topViewController.presentedViewController {
//                topViewController = presentedViewController
//            }
//
//            // Now, topViewController is the topmost view controller
//            let outgoingView = OutgoingCallUISetup()
//            topViewController.present(outgoingView, animated: true, completion: nil)
//        }
//        })
        
    }
    
    @IBAction private func actionOnContextToCallBtn(){
        print("Call_actionOnContextToCallBtn")
        if var topViewController = UIApplication.shared.windows.first?.rootViewController {
            while let presentedViewController = topViewController.presentedViewController {
                topViewController = presentedViewController
            }

            // Now, topViewController is the topmost view controller
            let webpage = CustomWebViewPage()
            webpage.url_value = WebService.contextToCallUrl.rawValue
            topViewController.present(webpage, animated: true, completion: nil)
        }
        
    }
}
extension CallValidationSetUp: UITextViewDelegate {

    public func textViewDidBeginEditing(_ textView: UITextView) {

        if !call_messageTextView.text!.isEmpty && call_messageTextView.text! == placeholderMess {
            call_messageTextView.text = ""
            call_messageTextView.textColor = .black
        }
    }

    public func textViewDidEndEditing(_ textView: UITextView) {
    
        if call_messageTextView.text.isEmpty {
            call_messageTextView.text = placeholderMess
            call_messageTextView.textColor = UIColor.lightGray
        }
    }
}
extension CallValidationSetUp:UITextFieldDelegate{
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if mobileVerificationCodeText.text?.count == 4{
            print("verify API Call")
            let channel_id = UserDefaults.standard.value(forKey: "channel_id") as? String
            print("country_code",country_code)
            verifyOtpByContactNo(channel_id: channel_id ?? "", contact_no: mobileText.text!, country_code: country_code, otp: mobileVerificationCodeText.text!)
        }
        if emailVerificationCodeText.text?.count == 4{
            print("verify API Call")
            let channel_id = UserDefaults.standard.value(forKey: "channel_id") as? String
            print("country_code",country_code)
            verifyOtpGivenByEmailAddress(channel_id: channel_id ?? "", email_id: emailText.text!, otp: emailVerificationCodeText.text!)
        }
    }
}
extension CallValidationSetUp:countryViewDelegate{
    func getCountryDetails(countryCode: String, countryName: String, code: String, countryId: String) {
        print("countryCode------",countryCode)
        print("countryName-----",countryName)
        print("code------",code)
        country_code = code
        self.countryCodeText.text = code + " " + countryName
    }
}
