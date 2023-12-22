//
//  SmsViewModel.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 05/12/23.
//

import Foundation
//import Alamofire
class SmsViewModel{
    var smsView:SmsViewController?
    
    
    
    func validation() -> Bool{
        if smsView?.contactNumberTextField.text == ""{
            showAlert(title: "Warning", message: "Please enter the contact number", view: smsView ?? UIViewController())
            return false
        }else if smsView?.messageTextView.text == ""{
            showAlert(title: "Warning", message: "Please enter the message", view: smsView ?? UIViewController())
            return false
        }else if smsView?.messageTextView.text == smsView?.placeholderMess{
            showAlert(title: "Warning", message: "Please enter the message", view: smsView ?? UIViewController())
            return false
        }
        else{
           print("Send ---- Done")
            return true
        }
    }
    
    
//    func sendSmsApiCalling(draft_id:String){
//        
//        let user_id = ""
//        let first_name = ""
//        let last_name = ""
//        let mobile = ""
//        let country_code = ""
//        //var mobile_array:[String] = []
//        
//        let header : HTTPHeaders = [ApiParaKey.send_SMS.c2c_request:"iOS"]
//        let param = [ApiParaKey.send_SMS.c2c_request:""] as EIDictonary
//        print("Compose Email Request",param)
//        API.post(Endpoint: .sendSMS, parameter: param, header: header,isBackgroudCalling:false , completion: {(response , error) in
//            if let error = error{
//               // Toast.showAlertMessage(message: error, alertType: .error)
//                showAlert(title:"",message: "",view: self.smsView ?? UIViewController())
//                return
//            }
//            showAlert(title:"",message: "",view: self.smsView ?? UIViewController())
//
//    })
//
//    }
}
