//
//  EmailValidationSetUp.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 12/12/23.
//

import Foundation
open class EmailValidationSetUp:BaseViewController{
    
    
    
    let emailModel = EmailValidationModel()
    var country_code:String = ""
    open override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Email"
        if #available(iOS 13.0, *) {
            email_messageTextView.textColor = UIColor.label
        } else {
            email_messageTextView.textColor = .black
        }
        cancelButton.addTarget(self, action: #selector(dismissSubView), for: .touchUpInside)
        countrySelectedButton.addTarget(self, action: #selector(actionOnSelectedCountryCodeBtn), for: .touchUpInside)
        
        contactCodeBtn.addTarget(self, action: #selector(actionOnContactCodeVerifyBtn), for: .touchUpInside)
        emailVerifyBtn.addTarget(self, action: #selector(actionOnEmailCodeVerifyBtn), for: .touchUpInside)
        
        checkBoxBtn.addTarget(self, action: #selector(actionOnCheckBoxBtn), for: .touchUpInside)
        termsAndConditonBtn.addTarget(self, action: #selector(actionOnTermsAndConditionsBtn), for: .touchUpInside)
        
        connectButton.addTarget(self, action: #selector(actionOnConnectBtn), for: .touchUpInside)
        contextToCallBtn.addTarget(self, action: #selector(actionOnContextToCallBtn), for: .touchUpInside)
        email_messageTextView.delegate = self
        mobileVerificationCodeText.delegate = self
        emailVerificationCodeText.delegate = self
        email_messageTextView.text = placeholderMess
        emailModel.emailView = self
        
        doneKeyboard(dismissOnTap: true)
        
        // Register for keyboard notifications
//                NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
//    deinit {
//            // Unregister for keyboard notifications when the view controller is deallocated
//            NotificationCenter.default.removeObserver(self)
//        }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpEmail_ValidationPage()
    }
    
    // MARK: - Keyboard Handling

//        @objc func keyboardWillShow(notification: Notification) {
//            if let userInfo = notification.userInfo,
//                       let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
//                        // Adjust content inset to move the scroll view up when the keyboard is shown
//                scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.size.height, right: 0)
//                scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.size.height, right: 0)
//                    }
//        }
    
}
//MARK: - Action On Button
extension EmailValidationSetUp{
    @IBAction private func dismissSubView(){
        dismiss(animated: true)
        print("Email_dismissSubView")
        
    }
    
    @IBAction private func actionOnSelectedCountryCodeBtn(){
        print("Email_actionOnSelectedCountryCodeBtn")
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
        if emailModel.mobileOTPValidation(){
            let channel_id = UserDefaults.standard.value(forKey: "channel_id") as? String
            print("country_code",country_code)
            self.contactCodeBtn.isEnabled = false
            secondsRemaining = 60
            self.countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateContactCountdown), userInfo: nil, repeats: true)
            sendOtpByContactNo(channel_id: channel_id ?? "", contact_no: mobileText.text!, country_code: country_code)
        }
    }
    @objc func updateContactCountdown() {
            // Update the countdown
            secondsRemaining -= 1
            
            // Update the button title
            updateContactCodeBtnTitle()
            
            // Check if the countdown is complete
            if secondsRemaining == 0 {
                countdownTimer?.invalidate() // Stop the timer
                contactCodeBtn.isEnabled = true
                contactCodeBtn.setTitle("Code", for: .normal)
                secondsRemaining = 60
            }
        }

        func updateContactCodeBtnTitle() {
            // Update the button title with the current countdown value
            contactCodeBtn.setTitle("\(secondsRemaining)", for: .normal)
        }
    
    @IBAction private func actionOnEmailCodeVerifyBtn(){
        print("Email_actionOnEmailCodeVerifyBtn")
        if emailModel.emailOTPValidation(){
            let channel_id = UserDefaults.standard.value(forKey: "channel_id") as? String
            print("country_code",country_code)
            self.emailVerifyBtn.isEnabled = false
            secondsRemaining = 60
            self.countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateEmailCountdown), userInfo: nil, repeats: true)
            sendOtpByEmailAddress(channel_id: channel_id ?? "", email_id: emailText.text!)
        }
    }
    @objc func updateEmailCountdown() {
            // Update the countdown
            secondsRemaining -= 1
            
            // Update the button title
            updateEmailCodeBtnTitle()
            
            // Check if the countdown is complete
            if secondsRemaining == 0 {
                countdownTimer?.invalidate() // Stop the timer
                emailVerifyBtn.isEnabled = true
                emailVerifyBtn.setTitle("Verify", for: .normal)
                secondsRemaining = 60
            }
        }

        func updateEmailCodeBtnTitle() {
            // Update the button title with the current countdown value
            emailVerifyBtn.setTitle("\(secondsRemaining)", for: .normal)
        }
    
    @IBAction private func actionOnCheckBoxBtn(){
        print("Email_actionOnCheckBoxBtn")
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
        print("Email_actionOnTermsAndConditionsBtn")
        
    }
    
    @IBAction private func actionOnConnectBtn(){
        print("Email_actionOnConnectBtn")
        if temp_variable == 1
        {
            if emailModel.validation(){
                print("Validated....")
                let channel_id = UserDefaults.standard.value(forKey: "channel_id") as? String
                    emailModel.send_EmailAddressAPI(channel_id:channel_id ?? "")
            }
        }
        
    }
    
    @IBAction private func actionOnContextToCallBtn(){
        print("Email_actionOnContextToCallBtn")
    }
}
extension EmailValidationSetUp: UITextViewDelegate {

    public func textViewDidBeginEditing(_ textView: UITextView) {

        if !email_messageTextView.text!.isEmpty && email_messageTextView.text! == placeholderMess {
            email_messageTextView.text = ""
            email_messageTextView.textColor = .black
        }
    }

    public func textViewDidEndEditing(_ textView: UITextView) {
    
        if email_messageTextView.text.isEmpty {
            email_messageTextView.text = placeholderMess
            email_messageTextView.textColor = UIColor.lightGray
        }
        
    }
}
extension EmailValidationSetUp:UITextFieldDelegate{
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
extension EmailValidationSetUp:countryViewDelegate{
    func getCountryDetails(countryCode: String, countryName: String, code: String, countryId: String) {
        print("countryCode------",countryCode)
        print("countryName-----",countryName)
        print("code------",code)
        country_code = code
        self.countryCodeText.text = code + " " + countryName
    }
}
