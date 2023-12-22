//
//  EmailValidationModel.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 12/12/23.
//

import Foundation
open class EmailValidationModel{
    var emailView:EmailValidationSetUp?
    func validation() -> Bool{
        if emailView?.email_preferences?.email_name ?? false{
            if emailView?.firstText.text == ""{
                showAlert(title: "Warning", message: "Please enter the first name", view: emailView ?? UIViewController())
                return false
            }else if emailView?.lastText.text == ""{
                showAlert(title: "Warning", message: "Please enter the last name", view: emailView ?? UIViewController())
                return false
            }
        }
        if emailView?.email_preferences?.email_contact ?? false{
            if emailView?.countryCodeText.text == ""{
                showAlert(title: "Warning", message: "Please select the country code", view: emailView ?? UIViewController())
                return false
            }else if emailView?.mobileText.text == ""{
                showAlert(title: "Warning", message: "Please enter the contact number", view: emailView ?? UIViewController())
                return false
            }
        }
        if emailView?.email_preferences?.email_verifycontact ?? false{
            if emailView?.mobileVerificationCodeText.text == ""{
                showAlert(title: "Warning", message: "Please enter the contact otp", view: emailView ?? UIViewController())
                return false
            }
        }
        if emailView?.email_preferences?.email_email ?? false{
             if emailView?.emailText.text == ""{
                showAlert(title: "Warning", message: "Please enter the email address", view: emailView ?? UIViewController())
                return false
            }
        }
        if emailView?.email_preferences?.email_verifyemail ?? false{
            if emailView?.emailVerificationCodeText.text == ""{
                showAlert(title: "Warning", message: "Please enter the email otp", view: emailView ?? UIViewController())
                return false
            }
        }
        if emailView?.email_messageTextView.text == ""{
            showAlert(title: "Warning", message: "Please enter the message", view: emailView ?? UIViewController())
            return false
        }
        if emailView?.email_messageTextView.text == emailView?.placeholderMess{
            showAlert(title: "Warning", message: "Please enter the message", view: emailView ?? UIViewController())
            return false
        }
        
        return true
    }
    
    
    func mobileOTPValidation() -> Bool{
        if emailView?.countryCodeText.text == ""{
            showAlert(title: "Warning", message: "Please select the country code", view: emailView ?? UIViewController())
            return false
        }else if emailView?.mobileText.text == ""{
            showAlert(title: "Warning", message: "Please enter the contact number", view: emailView ?? UIViewController())
            return false
        }else{
            return true
        }
    }
    
    func emailOTPValidation() -> Bool{
        if emailView?.emailText.text == ""{
            showAlert(title: "Warning", message: "Please enter the email address", view: emailView ?? UIViewController())
            return false
        }else{
            return true
        }
    }
    
    func send_EmailAddressAPI(channel_id:String){
        let name =  (emailView?.firstText.text! ?? "") + " " + (emailView?.lastText.text! ?? "")
        let param = [ApiParaKey.send_Email.channelId : channel_id,
                     ApiParaKey.send_Email.name:name,
                     ApiParaKey.send_Email.countrycode:(emailView?.country_code ?? ""),
                     ApiParaKey.send_Email.number:(emailView?.mobileText.text! ?? ""),
                     ApiParaKey.send_Email.numotp:(emailView?.mobileVerificationCodeText.text! ?? ""),
                     ApiParaKey.send_Email.email:(emailView?.emailText.text! ?? ""),
                     ApiParaKey.send_Email.mailotp:(emailView?.emailVerificationCodeText.text! ?? ""),
                     ApiParaKey.send_Email.message:(emailView?.email_messageTextView.text! ?? "")] as! EIDictonary
        print("send_EmailAddressAPI_param>>>>",param)
        API.post(Endpoint: .sendEmail, parameter: param,completion: {
            (response , error) in
                if let error = error{
                    print("Error",error)
                    showAlert(title: "Error", message: error, view: self.emailView ?? UIViewController())
                    return
                }
            if let status = response?["status"] as? NSNumber{
                if status == 200{
                    DispatchQueue.main.async {
                        showAlertWithOkAction(title: "Success", message: response?["message"] as? String ?? "", view: self.emailView ?? UIViewController(), actionHandler: {
                            self.emailView?.dismiss(animated: true)
                        })
                        
                    }
                }
            }
            
            
        })
        
    }
}
