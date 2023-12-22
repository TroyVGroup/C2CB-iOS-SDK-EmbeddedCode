//
//  File.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 07/12/23.
//

import Foundation
open class SmsValidationModel{
    var smsView:SMSValidationSetUp?
    func validation() -> Bool{
        if smsView?.sms_preferences?.sms_name ?? false{
            if smsView?.firstText.text == ""{
                showAlert(title: "Warning", message: "Please enter the first name", view: smsView ?? UIViewController())
                return false
            }else if smsView?.lastText.text == ""{
                showAlert(title: "Warning", message: "Please enter the last name", view: smsView ?? UIViewController())
                return false
            }
        }
        if smsView?.sms_preferences?.sms_contact ?? false{
            if smsView?.countryCodeText.text == ""{
                showAlert(title: "Warning", message: "Please select the country code", view: smsView ?? UIViewController())
                return false
            }else if smsView?.mobileText.text == ""{
                showAlert(title: "Warning", message: "Please enter the contact number", view: smsView ?? UIViewController())
                return false
            }
        }
        if smsView?.sms_preferences?.sms_verifycontact ?? false{
            if smsView?.mobileVerificationCodeText.text == ""{
                showAlert(title: "Warning", message: "Please enter the contact otp", view: smsView ?? UIViewController())
                return false
            }
        }
        if smsView?.sms_preferences?.sms_email ?? false{
             if smsView?.emailText.text == ""{
                showAlert(title: "Warning", message: "Please enter the email address", view: smsView ?? UIViewController())
                return false
            }
        }
        if smsView?.sms_preferences?.sms_verifyemail ?? false{
            if smsView?.emailVerificationCodeText.text == ""{
                showAlert(title: "Warning", message: "Please enter the email otp", view: smsView ?? UIViewController())
                return false
            }
        }
        if smsView?.sms_messageTextView.text == ""{
            showAlert(title: "Warning", message: "Please enter the message", view: smsView ?? UIViewController())
            return false
        }
        if smsView?.sms_messageTextView.text == smsView?.placeholderMess{
            showAlert(title: "Warning", message: "Please enter the message", view: smsView ?? UIViewController())
            return false
        }
        
        return true
    }
    func emailOTPValidation() -> Bool{
        if smsView?.emailText.text == ""{
            showAlert(title: "Warning", message: "Please enter the email address", view: smsView ?? UIViewController())
            return false
        }else{
            return true
        }
    }
    func mobileOTPValidation() -> Bool{
        if smsView?.countryCodeText.text == ""{
            showAlert(title: "Warning", message: "Please select the country code", view: smsView ?? UIViewController())
            return false
        }else if smsView?.mobileText.text == ""{
            showAlert(title: "Warning", message: "Please enter the contact number", view: smsView ?? UIViewController())
            return false
        }else{
            return true
        }
    }
    func send_SMSAPI(channel_id:String){
        let name =  (smsView?.firstText.text! ?? "") + " " + (smsView?.lastText.text! ?? "")
        let param = [ApiParaKey.send_SMS.channelId : channel_id,
                     ApiParaKey.send_SMS.name:name,
                     ApiParaKey.send_SMS.countrycode:(smsView?.country_code ?? ""),
                     ApiParaKey.send_SMS.number:(smsView?.mobileText.text! ?? ""),
                     ApiParaKey.send_SMS.numotp:(smsView?.mobileVerificationCodeText.text! ?? ""),
                     ApiParaKey.send_SMS.email:(smsView?.emailText.text! ?? ""),
                     ApiParaKey.send_SMS.mailotp:(smsView?.emailVerificationCodeText.text! ?? ""),
                     ApiParaKey.send_SMS.message:(smsView?.sms_messageTextView.text! ?? "")] as! EIDictonary
        print("send_EmailAddressAPI_param>>>>",param)
        API.post(Endpoint: .sendSms, parameter: param,completion: {
            (response , error) in
                if let error = error{
                    print("Error",error)
                    showAlert(title: "Error", message: error, view: self.smsView ?? UIViewController())
                    return
                }
            if let status = response?["status"] as? NSNumber{
                if status == 200{
                    DispatchQueue.main.async {
                        showAlertWithOkAction(title: "Success", message: response?["message"] as? String ?? "", view: self.smsView ?? UIViewController(), actionHandler: {
                            self.smsView?.dismiss(animated: true)
                        })
                        
                    }
                }
            }
            
            
        })
        
    }
}
