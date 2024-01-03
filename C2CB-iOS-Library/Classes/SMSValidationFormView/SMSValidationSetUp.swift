//
//  SMSValidationSetUp.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 07/12/23.
//

import Foundation
open class SMSValidationSetUp:BaseViewController{
    
    
    let smsModel = SmsValidationModel()
    var country_code:String = ""
    open override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "SMS"
        if #available(iOS 13.0, *) {
            sms_messageTextView.textColor = UIColor.label
        } else {
            sms_messageTextView.textColor = .black
        }
        cancelButton.addTarget(self, action: #selector(dismissSubView), for: .touchUpInside)
        countrySelectedButton.addTarget(self, action: #selector(actionOnSelectedCountryCodeBtn), for: .touchUpInside)
        
        contactCodeBtn.addTarget(self, action: #selector(actionOnContactCodeVerifyBtn), for: .touchUpInside)
        emailVerifyBtn.addTarget(self, action: #selector(actionOnEmailCodeVerifyBtn), for: .touchUpInside)
        
        checkBoxBtn.addTarget(self, action: #selector(actionOnCheckBoxBtn), for: .touchUpInside)
        termsAndConditonBtn.addTarget(self, action: #selector(actionOnTermsAndConditionsBtn), for: .touchUpInside)
        
        connectButton.addTarget(self, action: #selector(actionOnConnectBtn), for: .touchUpInside)
        contextToCallBtn.addTarget(self, action: #selector(actionOnContextToCallBtn), for: .touchUpInside)
        sms_messageTextView.delegate = self
        mobileVerificationCodeText.delegate = self
        emailVerificationCodeText.delegate = self
        sms_messageTextView.text = placeholderMess
        smsModel.smsView = self
        doneKeyboard(dismissOnTap: true)
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpSMS_ValidationPage()
    }
    
}
extension SMSValidationSetUp{
    
    @IBAction private func dismissSubView(){
        dismiss(animated: true)
        countdownTimer?.invalidate() // Stop the timer
        print("SMS_dismissSubView")
        
    }
    
    
    @IBAction private func actionOnSelectedCountryCodeBtn(){
        print("SMS_actionOnSelectedCountryCodeBtn")
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
        print("SMS_actionOnContactCodeVerifyBtn")
        if smsModel.mobileOTPValidation(){
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
        if smsModel.emailOTPValidation(){
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
        print("SMS_actionOnCheckBoxBtn")
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
        print("SMS_actionOnTermsAndConditionsBtn")
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
        print("SMS_actionOnConnectBtn")
        if temp_variable == 1
        {
            if smsModel.validation(){
                print("Validated....")
                let channel_id = UserDefaults.standard.value(forKey: "channel_id") as? String
                smsModel.send_SMSAPI(channel_id: channel_id ?? "")
            }
        }
        
    }
    
    @IBAction private func actionOnContextToCallBtn(){
        print("SMS_actionOnContextToCallBtn")
        
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
extension SMSValidationSetUp: UITextViewDelegate {

    public func textViewDidBeginEditing(_ textView: UITextView) {

        if !sms_messageTextView.text!.isEmpty && sms_messageTextView.text! == placeholderMess {
            sms_messageTextView.text = ""
            sms_messageTextView.textColor = .black
        }
    }

    public func textViewDidEndEditing(_ textView: UITextView) {
    
        if sms_messageTextView.text.isEmpty {
            sms_messageTextView.text = placeholderMess
            sms_messageTextView.textColor = UIColor.lightGray
        }
    }
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            // Check if the new text length would exceed the limit
            let newText = (sms_messageTextView.text as NSString).replacingCharacters(in: range, with: text)
            return newText.count <= 160
        }
    public func textViewDidChange(_ textView: UITextView) {
            // Update any UI or perform actions as needed when the text changes
            updateCharacterCount()
    }
    func updateCharacterCount() {
            // Update the character count label based on the current text length
            let currentCount = sms_messageTextView.text.count
            print("\(currentCount)/160")
           sms_message_characterCountLabel.text! = "\(currentCount)/160"
    }
}

extension SMSValidationSetUp:UITextFieldDelegate{
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



extension SMSValidationSetUp:countryViewDelegate{
    func getCountryDetails(countryCode: String, countryName: String, code: String, countryId: String) {
        print("countryCode------",countryCode)
        print("countryName-----",countryName)
        print("code------",code)
        country_code = code
        self.countryCodeText.text = code + " " + countryName
    }
}
