//
//  APIConfig.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 05/12/23.
//

import Foundation
//import Alamofire
import UIKit
public enum WebService:String{
    
    //MARK: -  Development
        case baseURLPath = "https://dev-api.vgroupinc.com/dev_c2c/"

       // case chennelId = "61481b12e138eb7dc3007579"
    
    //MARK: - Please change the baseUrl in NotificationViewController
    
    enum method:String {
        case getAllCountries = "global/master/ur/countrylistsorted"
        case getChannelMode = "product/channel/ur/modes/"
        case sendSMSOtp = "utilities/twilio/ur/sms/otp"
        case smsVerifyOtp = "utilities/twilio/ur/sms/verify/otp"
        case sendEmailOtp = "utilities/mail/ur/email/otp"
        case sendEmailVerifyOtp = "utilities/mail/ur/email/verify/otp"
        //Email
        case sendEmail = "utilities/mail/ur/send/mail"
        //SMS
        case sendSms = "utilities/twilio/ur/send/sms"
        
        // call
        case initiate_call = "utilities/twilio/ur/initiate/call"
        //token
        case call_token = "utilities/twilio/ur/generate/token"
        
        //cancel call
        case call_cancel = "utilities/twilio/ur/cancel/call"
    }
    
}
class API{
    //MARK: - Get Method
    static func get(Endpoint:WebService.method, parameter: String? ,completion: @escaping ([String:Any]?, String?) -> Void) {
        var queryParameter: String = ""
        var queryParameter1: String = ""
        if let parameter = parameter {
            if Endpoint == .getChannelMode{
                queryParameter = parameter
                //parameter.remove(at: 0)
            }
            
        }
        guard let url = URL.init(string: WebService.baseURLPath.rawValue+Endpoint.rawValue + queryParameter + queryParameter1) else {
            print("Invalid URL")
            return
        }
        
        // Create a URL request
        var request = URLRequest(url: url)
        print("URL>>>>>>>>>>>",url)
        request.addValue(Constant.bundle_idenitifier ?? "", forHTTPHeaderField: "request-package")
        request.httpMethod = "GET"
        
        // Create a URLSession task
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check for errors
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            // Check for a successful HTTP response
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid HTTP response")
                return
            }
            
            // Check if data is available
            guard let data = data else {
                print("No data received")
                return
            }
            //                    guard let data = data else {
            //                        print("No data received")
            //                        return
            //                    }
            
            do {
                //try JSONSerialization.jsonObject(with: data, options: [])
                guard let data = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                let empty = data["empty"] as? Bool
                if empty == false{
                    completion(nil, "Missing Api")
                    return
                }
                
                let status = data["status"] as? NSNumber
                if status == 200 || status == true {
                    completion(data, nil)
                }
                else {
                    guard let mes = data["message"] as? [String] else {
                        let message = data["error"] as? String
                        completion(nil, message)
                        return
                    }
                    
                    var err: String = ""
                    
                    if mes.count == 1 {
                        err = mes[0]
                    } else if mes.count == 2 {
                        err = "\(mes[0]), \(mes[1]) "
                    }
                    completion(nil, err)
                }
                
            } catch {
                completion(nil, error.localizedDescription)
            }
        }
        
        // Start the URLSession task
        task.resume()
    }
    
    
    //MARK: - POST method
    static func post(Endpoint:WebService.method, parameter:[String:Any],completion: @escaping ([String:Any]?, String?) -> Void) {
        var queryParameter: String = ""
        var queryParameter1: String = ""
        guard let url = URL.init(string: WebService.baseURLPath.rawValue+Endpoint.rawValue + queryParameter + queryParameter1) else {
            print("Invalid URL")
            return
        }
        // Convert the parameters to JSON data
        guard let postData = try? JSONSerialization.data(withJSONObject: parameter) else {
            print("Error converting parameters to JSON")
            return
        }
        
        // Create a URL request
        var request = URLRequest(url: url)
        print("URL>>>>>>>>>>>",url)
        request.addValue(Constant.bundle_idenitifier ?? "", forHTTPHeaderField: "request-package")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postData
        
        // Create a URLSession task
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Check for errors
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            // Check for a successful HTTP response
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid HTTP response")
                return
            }
            
            // Check if data is available
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                //try JSONSerialization.jsonObject(with: data, options: [])
                guard let data = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                let status = data["status"] as? NSNumber
                if status == 200 || status == true {
                    completion(data, nil)
                }
                else {
                    guard let mes = data["message"] as? [String] else {
                        let message = data["error"] as? String
                        completion(nil, message)
                        return
                    }
                    
                    var err: String = ""
                    
                    if mes.count == 1 {
                        err = mes[0]
                    } else if mes.count == 2 {
                        err = "\(mes[0]), \(mes[1]) "
                    }
                    completion(nil, err)
                }
                
            } catch {
                completion(nil, error.localizedDescription)
            }
        }
        
        // Start the URLSession task
        task.resume()
    }
}
