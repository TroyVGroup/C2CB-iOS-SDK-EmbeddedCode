//
//  ChannelModePage.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 14/12/23.
//

import Foundation
public class ChannelMode{
    public static var callBtn:Bool = true
    
}
struct ChannelViewModel : Codable {
    let response : String?
    let channel : Channel?
    let message : String?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case channel = "channel"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        channel = try values.decodeIfPresent(Channel.self, forKey: .channel)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}
struct Channel : Codable {
    let smsstats : Smsstats?
    let emailstats : Emailstats?
    let callstats : Callstats?
    let preferences : Preferences?
    let countries : [Countries]?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case smsstats = "smsstats"
        case emailstats = "emailstats"
        case callstats = "callstats"
        case preferences = "preferences"
        case countries = "countries"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        smsstats = try values.decodeIfPresent(Smsstats.self, forKey: .smsstats)
        emailstats = try values.decodeIfPresent(Emailstats.self, forKey: .emailstats)
        callstats = try values.decodeIfPresent(Callstats.self, forKey: .callstats)
        preferences = try values.decodeIfPresent(Preferences.self, forKey: .preferences)
        countries = try values.decodeIfPresent([Countries].self, forKey: .countries)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}
struct Smsstats : Codable {
    let enable : Bool?
    let id : String?

    enum CodingKeys: String, CodingKey {

        case enable = "enable"
        case id = "id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        enable = try values.decodeIfPresent(Bool.self, forKey: .enable)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }

}
struct Emailstats : Codable {
    let enable : Bool?
    let id : String?

    enum CodingKeys: String, CodingKey {

        case enable = "enable"
        case id = "id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        enable = try values.decodeIfPresent(Bool.self, forKey: .enable)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }

}
struct Callstats : Codable {
    let enable : Bool?
    let dialpad : Bool?
    let id : String?

    enum CodingKeys: String, CodingKey {

        case enable = "enable"
        case dialpad = "dialpad"
        case id = "id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        enable = try values.decodeIfPresent(Bool.self, forKey: .enable)
        dialpad = try values.decodeIfPresent(Bool.self, forKey: .dialpad)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }

}
struct Preferences : Codable {
    let call_contact : Bool?
    let call_verifyemail : Bool?
    let sms_verifyemail : Bool?
    let sms_verifycontact : Bool?
    let email_verifycontact : Bool?
    let call_email : Bool?
    let sms_name : Bool?
    let call_message : Bool?
    let call_verifycontact : Bool?
    let call_name : Bool?
    let email_email : Bool?
    let email_message : Bool?
    let sms_message : Bool?
    let email_name : Bool?
    let sms_contact : Bool?
    let email_contact : Bool?
    let sms_email : Bool?
    let email_verifyemail : Bool?

    enum CodingKeys: String, CodingKey {

        case call_contact = "call_contact"
        case call_verifyemail = "call_verifyemail"
        case sms_verifyemail = "sms_verifyemail"
        case sms_verifycontact = "sms_verifycontact"
        case email_verifycontact = "email_verifycontact"
        case call_email = "call_email"
        case sms_name = "sms_name"
        case call_message = "call_message"
        case call_verifycontact = "call_verifycontact"
        case call_name = "call_name"
        case email_email = "email_email"
        case email_message = "email_message"
        case sms_message = "sms_message"
        case email_name = "email_name"
        case sms_contact = "sms_contact"
        case email_contact = "email_contact"
        case sms_email = "sms_email"
        case email_verifyemail = "email_verifyemail"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        call_contact = try values.decodeIfPresent(Bool.self, forKey: .call_contact)
        call_verifyemail = try values.decodeIfPresent(Bool.self, forKey: .call_verifyemail)
        sms_verifyemail = try values.decodeIfPresent(Bool.self, forKey: .sms_verifyemail)
        sms_verifycontact = try values.decodeIfPresent(Bool.self, forKey: .sms_verifycontact)
        email_verifycontact = try values.decodeIfPresent(Bool.self, forKey: .email_verifycontact)
        call_email = try values.decodeIfPresent(Bool.self, forKey: .call_email)
        sms_name = try values.decodeIfPresent(Bool.self, forKey: .sms_name)
        call_message = try values.decodeIfPresent(Bool.self, forKey: .call_message)
        call_verifycontact = try values.decodeIfPresent(Bool.self, forKey: .call_verifycontact)
        call_name = try values.decodeIfPresent(Bool.self, forKey: .call_name)
        email_email = try values.decodeIfPresent(Bool.self, forKey: .email_email)
        email_message = try values.decodeIfPresent(Bool.self, forKey: .email_message)
        sms_message = try values.decodeIfPresent(Bool.self, forKey: .sms_message)
        email_name = try values.decodeIfPresent(Bool.self, forKey: .email_name)
        sms_contact = try values.decodeIfPresent(Bool.self, forKey: .sms_contact)
        email_contact = try values.decodeIfPresent(Bool.self, forKey: .email_contact)
        sms_email = try values.decodeIfPresent(Bool.self, forKey: .sms_email)
        email_verifyemail = try values.decodeIfPresent(Bool.self, forKey: .email_verifyemail)
    }

}
