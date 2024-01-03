//
//  ApiParaKey.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 05/12/23.
//

import Foundation
class ApiParaKey{
   

    struct send_SMS_Otp{
        static let channelid = "channelid"
        static let countrycode = "countrycode"
        static let number = "number"
    }
    struct sms_verify_Otp{
        static let channelid = "channelid"
        static let countrycode = "countrycode"
        static let number = "number"
        static let otp = "otp"
    }
    struct send_Email_Otp{
        static let channelid = "channelid"
        static let email = "email"
    }
    struct send_Email_Verify_Otp{
        static let channelid = "channelid"
        static let email = "email"
        static let otp = "otp"
    }
    struct send_Email{
        static let channelId = "channelId"
        static let countrycode = "countrycode"
        static let email = "email"
        static let mailotp = "mailotp"
        static let message = "message"
        static let name = "name"
        static let number = "number"
        static let numotp = "numotp"
    }
    struct send_SMS{
        static let channelId = "channelId"
        static let countrycode = "countrycode"
        static let email = "email"
        static let mailotp = "mailotp"
        static let message = "message"
        static let name = "name"
        static let number = "number"
        static let numotp = "numotp"
    }
    
    struct initial_call{
        static let channelId = "channelId"
        static let countrycode = "countrycode"
        static let email = "email"
        static let mailotp = "mailotp"
        static let message = "message"
        static let name = "name"
        static let number = "number"
        static let numotp = "numotp"
    }
    struct get_Token{
        static let authId = "authId"
    }
    struct cancel_Call{
        static let Token = "Token"
    }
}

