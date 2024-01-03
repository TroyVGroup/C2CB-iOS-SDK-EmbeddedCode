//
//  CallValidationForm.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 12/12/23.
//

import Foundation
open class CallValidationModel{
    var callView:CallValidationSetUp?
    func validation() -> Bool{
        if callView?.call_preferences?.call_name ?? false{
            if callView?.firstText.text == ""{
                showAlert(title: "Warning", message: "Please enter the first name", view: callView ?? UIViewController())
                return false
            }else if callView?.lastText.text == ""{
                showAlert(title: "Warning", message: "Please enter the last name", view: callView ?? UIViewController())
                return false
            }
        }
        if callView?.call_preferences?.call_contact ?? false{
            if callView?.countryCodeText.text == ""{
                showAlert(title: "Warning", message: "Please select the country code", view: callView ?? UIViewController())
                return false
            }else if callView?.mobileText.text == ""{
                showAlert(title: "Warning", message: "Please enter the contact number", view: callView ?? UIViewController())
                return false
            }
        }
        if callView?.call_preferences?.call_verifycontact ?? false{
            if callView?.mobileVerificationCodeText.text == ""{
                showAlert(title: "Warning", message: "Please enter the contact otp", view: callView ?? UIViewController())
                return false
            }
        }
        if callView?.call_preferences?.call_email ?? false{
             if callView?.emailText.text == ""{
                showAlert(title: "Warning", message: "Please enter the email address", view: callView ?? UIViewController())
                return false
            }
        }
        if callView?.call_preferences?.call_verifyemail ?? false{
            if callView?.emailVerificationCodeText.text == ""{
                showAlert(title: "Warning", message: "Please enter the email otp", view: callView ?? UIViewController())
                return false
            }
        }
        if callView?.call_messageTextView.text == ""{
            showAlert(title: "Warning", message: "Please enter the message", view: callView ?? UIViewController())
            return false
        }
        if callView?.call_messageTextView.text == callView?.placeholderMess{
            showAlert(title: "Warning", message: "Please enter the message", view: callView ?? UIViewController())
            return false
        }
        
        return true
    }
    
    
    func mobileOTPValidation() -> Bool{
        if callView?.countryCodeText.text == ""{
            showAlert(title: "Warning", message: "Please select the country code", view: callView ?? UIViewController())
            return false
        }else if callView?.mobileText.text == ""{
            showAlert(title: "Warning", message: "Please enter the contact number", view: callView ?? UIViewController())
            return false
        }else{
            return true
        }
    }
    
    func emailOTPValidation() -> Bool{
        if callView?.emailText.text == ""{
            showAlert(title: "Warning", message: "Please enter the email address", view: callView ?? UIViewController())
            return false
        }else{
            return true
        }
    }
    
    func initial_callAPiCalling(channel_id:String){
        let name =  (callView?.firstText.text! ?? "") + " " + (callView?.lastText.text! ?? "")
        let param = [ApiParaKey.initial_call.channelId : channel_id,
                     ApiParaKey.initial_call.name:name,
                     ApiParaKey.initial_call.countrycode:(callView?.country_code ?? ""),
                     ApiParaKey.initial_call.number:(callView?.mobileText.text! ?? ""),
                     ApiParaKey.initial_call.numotp:(callView?.mobileVerificationCodeText.text! ?? ""),
                     ApiParaKey.initial_call.email:(callView?.emailText.text! ?? ""),
                     ApiParaKey.initial_call.mailotp:(callView?.emailVerificationCodeText.text! ?? ""),
                     ApiParaKey.initial_call.message:(callView?.call_messageTextView.text! ?? "")] as! EIDictonary
        print("send_EmailAddressAPI_param>>>>",param)
        API.post(Endpoint: .initiate_call, parameter: param,completion: {
            (response , error) in
                if let error = error{
                    print("Error",error)
                    showAlert(title: "Error", message: error, view: self.callView ?? UIViewController())
                    return
                }
            if let status = response?["status"] as? NSNumber{
                if status == 200{
                    DispatchQueue.main.async {
                        print("Response>>>>>",response!)
                        let callauth = response?["callauth"] as? EIDictonary
                        let auth_id =  callauth?["id"] as? String
                        self.gettoken(auth_id: auth_id ?? "")
                       // self.callView?.dismiss(animated: true)
                        
                    }
                }
            }
            
            
        })
        
    }
   
    func gettoken(auth_id:String){
        let param = [ApiParaKey.get_Token.authId : auth_id] as! EIDictonary
        print("send_EmailAddressAPI_param>>>>",param)
        API.post(Endpoint: .call_token, parameter: param,completion: {
            (response , error) in
                if let error = error{
                    print("Error",error)
                    showAlert(title: "Error", message: error, view: self.callView ?? UIViewController())
                    return
                }
            if let status = response?["status"] as? NSNumber{
                if status == 200{
                    DispatchQueue.main.async {
                        print("Response>>>>>",response!)
                        let token = response?["token"] as? EIDictonary
                        let call_id = token?["id"] as? String
                        let call_token_Value = token?["value"] as? String
                        
                        let verified = response?["verified"] as? EIDictonary
                        let verified_mobile_no = verified?["call"] as? String
                        let call_ext = verified?["ext"] as? String
                        
                        UserDefaults.standard.set(verified_mobile_no, forKey: "verified_mobile_no")
                        UserDefaults.standard.set(call_ext, forKey: "call_ext")
                        
                        UserDefaults.standard.set(call_id, forKey: "call_id")
                        UserDefaults.standard.set(call_token_Value, forKey: "call_token")
                        print("call_id>>>>>>",call_id ?? "")
                        print("call_token_Value>>>>>>",call_token_Value ?? "")
                        self.callView?.dismiss(animated: true,completion: {
                            if var topViewController = UIApplication.shared.windows.first?.rootViewController {
                                while let presentedViewController = topViewController.presentedViewController {
                                    topViewController = presentedViewController
                                }
                                // Now, topViewController is the topmost view controller
                                let outgoingView = OutgoingCallUISetup()
                                topViewController.present(outgoingView, animated: true, completion: nil)
                            }
                        })
                        
                    }
                }
            }
        })
        
    }
    
    
    
    
}
