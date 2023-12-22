//
//  Helper.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 05/12/23.
//

import Foundation
//import Alamofire
//
//class Helper {
//    
//    enum  method: String {
//        case post = "POST"
//        case get = "GET"
//    }
//    
//    static func postMethod() -> String {
//        return method.post.rawValue
//    }
//    
//    static func getMethod() -> String {
//        return method.get.rawValue
//    }
//    
//    static var isConnectedToInternet: Bool {
//        return NetworkReachabilityManager()!.isReachable
//    }
//    
//    static func dataToJSON(data: Data) -> AnyObject? {
//         do {
//             return try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as AnyObject
//         } catch let myJSONError {
//             print(myJSONError)
//         }
//         return nil
//     }
//    
//    static func jsonToData(json: Any) -> Data? {
//         do {
//             return try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
//         } catch let myJSONError {
//             print(myJSONError)
//         }
//         return nil;
//     }
//    
//}
//
