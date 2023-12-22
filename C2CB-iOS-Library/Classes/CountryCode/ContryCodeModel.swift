//
//  ContryCodeModel.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 13/12/23.
//

import Foundation
struct CountryModel : Codable {
    let response : String?
    let countries : [Countries]?
    let message : String?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case countries = "countries"
        case message = "message"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        countries = try values.decodeIfPresent([Countries].self, forKey: .countries)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}

struct Countries : Codable {
    let country : String?
    let code : String?
    let countryCode : String?
    let id : String?

    enum CodingKeys: String, CodingKey {

        case country = "country"
        case code = "code"
        case countryCode = "countryCode"
        case id = "id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        countryCode = try values.decodeIfPresent(String.self, forKey: .countryCode)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }

}

