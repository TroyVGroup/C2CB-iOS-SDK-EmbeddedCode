//
//  EIColor.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 05/12/23.
//

import Foundation
import UIKit

class EIColor: UIColor {

    //static let NavigatioBarColor = UIColor(red: CGFloat(1 / 255.0), green: CGFloat(166 / 255.0), blue: CGFloat(255 / 255.0), alpha: CGFloat(1))
    static let NavigatioBarColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    
    static let buttonBackgroundColor = UIColor(red: CGFloat(255 / 255.0), green: CGFloat(87 / 255.0), blue: CGFloat(87 / 255.0), alpha: CGFloat(1))
    
    static let ThemeColor = UIColor(red: CGFloat(255 / 255.0), green: CGFloat(87 / 255.0), blue: CGFloat(87 / 255.0), alpha: CGFloat(1))
    
    static let SegmentColor = UIColor(red: CGFloat(233 / 255.0), green: CGFloat(233 / 255.0), blue: CGFloat(233 / 255.0), alpha: CGFloat(1))
    
    static let NavigatioBarFontColor = UIColor(red: 63.0/255.0, green: 63.0/255.0, blue: 63.0/255.0, alpha: 1.0)
    static let TopBarTextColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    
    static let BackgroungColor = UIColor(red: CGFloat(238 / 255.0), green: CGFloat(238 / 255.0), blue: CGFloat(238 / 255.0), alpha: CGFloat(1))
    
     static let secondBttonBackgroundColor = UIColor(red: CGFloat(240 / 255.0), green: CGFloat(240 / 255.0), blue: CGFloat(240 / 255.0), alpha: CGFloat(1))
    
    static let buttonFontColor = UIColor(red: CGFloat(255.0 / 255.0), green: CGFloat(255.0 / 255.0), blue: CGFloat(255.0 / 255.0), alpha: CGFloat(1))
    
    static let SelectedTabColor = UIColor.white
    
    static let DeselectedTabColor =  UIColor(red: 199.0/255.0, green: 199.0/255.0, blue: 199.0/255.0, alpha: 1.0)
   
    static let createReqBtnBGColor = UIColor(red: 45.0/255.0, green: 190.0/255.0, blue: 96.0/255.0, alpha: 1.0)
    
    static let historyBtnBGColor = UIColor(red: 248.0/255.0, green: 86.0/255.0, blue: 87.0/255.0, alpha: 1.0)

    static let reqApprovedTextColor = UIColor(red: 69.0/255.0, green: 171.0/255.0, blue: 1.0/255.0, alpha: 1.0)
    
    static let reqPendingTextColor = UIColor(red: 229.0/255.0, green: 141.0/255.0, blue: 26.0/255.0, alpha: 1.0)
    
    static let reqRejectedTextColor = UIColor(red: 255.0/255.0, green: 12.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    
    static let reqCompletedTextColor = UIColor(red: 39.0/255.0, green: 90.0/255.0, blue: 135.0/255.0, alpha: 1.0)
    
     static let forgotButtonTextColor = UIColor(red: 63.0/255.0, green: 63.0/255.0, blue: 63.0/255.0, alpha: 1.0)
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    convenience init(hexString:String) {
        let hexString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner            = Scanner(string: hexString as String)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
}
