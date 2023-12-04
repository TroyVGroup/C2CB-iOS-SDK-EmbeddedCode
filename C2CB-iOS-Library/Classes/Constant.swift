//
//  Constant.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 04/12/23.
//

import Foundation
public class Constant{
    public static var bundle: Bundle {
        let podBundle = Bundle(for: self)
        if let bundleURL = podBundle.url(forResource: "C2CB-iOS-Library", withExtension: "bundle") {
            return Bundle(url: bundleURL)!
        } else {
            return podBundle
        }
    }
    public static func getImage(named: String) -> UIImage? {
        return UIImage(named: named, in: bundle, compatibleWith: nil)
    }
    
}
