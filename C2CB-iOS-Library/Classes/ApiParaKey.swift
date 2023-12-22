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
}

//token

//authId
//:
//"6585689123426f03c26b41d0"


//response
//{
//    "response": "Success",
//    "verified": {
//        "call": "+919304712071",
//        "ext": ""
//    },
//    "message": "Token generated.",
//    "status": 200,
//    "token": {
//        "id": "6585689123426f03c26b41d0",
//        "value": "eyJjdHkiOiJ0d2lsaW8tZnBhO3Y9MSIsInR5cCI6IkpXVCIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJTSzhlYWU3YjhiNTllNGNmYjk1NGIxNDMzMDk2MGQxNmRjIiwiZXhwIjoxNzAzMjQ1NDc0LCJncmFudHMiOnsidm9pY2UiOnsiaW5jb21pbmciOnsiYWxsb3ciOmZhbHNlfSwib3V0Z29pbmciOnsiYXBwbGljYXRpb25fc2lkIjoiQVA4ZDYyZjRhYjQyZTg1ZDhjNmUwMDZmODFiMjgxM2I2OSJ9fSwiaWRlbnRpdHkiOiJ1c2VyIn0sImp0aSI6IlNLOGVhZTdiOGI1OWU0Y2ZiOTU0YjE0MzMwOTYwZDE2ZGMtMTcwMzI0MTg1NiIsInN1YiI6IkFDMTRlYWQ2ZmYyNDk4YjMzYzdhZGQ0MmYyODMzMzZkMDQifQ.aLTbs8jnktxnLxwUkqgchw8JKVlV1j_Fr-E8dDqLp0I"
//    }
//}


//
