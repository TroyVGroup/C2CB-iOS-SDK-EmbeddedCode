//
//  Constant.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 04/12/23.
//

import Foundation
public typealias EIArray = [Any]
public typealias EIDictonary = [String:Any]
public typealias EIDictonaryToDictionary = [String:[String:Any]]
public typealias EIDictonaryArray = [[String:Any]]
public typealias alertActionHandler = () -> Void
class Constant:NSObject{
    
    static var shared: Constant = {
            let object = Constant.init()
            return object
        }()
    
    public  var callBtn:Bool?
    public  var smsBtn:Bool?
    public  var emailBtn:Bool?
    public static var bundle_idenitifier = Bundle.main.bundleIdentifier
    public static var IS_IPAD = (UI_USER_INTERFACE_IDIOM() == .pad)
    public static var bundle: Bundle {
        let podBundle = Bundle(for: self)
        if let bundleURL = podBundle.url(forResource: "Resources", withExtension: "bundle") {
            return Bundle(url: bundleURL)!
        } else {
            return podBundle
        }
    }
    public static func getImage(named: String) -> UIImage? {
        return UIImage(named: named, in: bundle, compatibleWith: nil)
    }
    
    static func dataToJSON(data: Data) -> AnyObject? {
         do {
             return try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as AnyObject
         } catch let myJSONError {
             print(myJSONError)
         }
         return nil
     }
    
    
    
    
    static func jsonToData(json: Any) -> Data? {
         do {
             return try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
         } catch let myJSONError {
             print(myJSONError)
         }
         return nil;
     }
    
    
}


extension UIViewController {

    public func doneKeyboard(dismissOnTap:Bool) {
        // Setup Keyboard observers
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        // Setup Tap Gesture to dismiss keyboard on tap
        if dismissOnTap {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            self.view.addGestureRecognizer(tap)
        }
        
    }
    
    // Handle Tap Gesture
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    @objc func keyboardWillChange(notification: Notification) {
        var location: CGFloat = 0
        var tfvHeight: CGFloat = 0
        
        // Get current firstResponder and check if it is a TextField
        if let activeTextField = UIResponder.currentFirstResponder as? UITextField {
            
            // Get the height of the Text Field
            tfvHeight = activeTextField.frame.size.height
            
            // Check if we can get its origin w.r.t. screen
            if let globalPoint = activeTextField.superview?.convert(activeTextField.frame.origin, to: nil) {
                
                // Set the y coordinate in location
                location = globalPoint.y
            }
        } else {
            
            // Get current firstResponder and check if it is a TextView
            if let activeTextView = UIResponder.currentFirstResponder as? UITextView {
                
                // Get the height of the Text View
                tfvHeight = activeTextView.frame.size.height
                
                // Check if we can get its origin w.r.t. screen
                if let globalPoint = activeTextView.superview?.convert(activeTextView.frame.origin, to: nil) {
                    
                    // Set the y coordinate in location
                    location = globalPoint.y
                }
            }
        }
        
        // Calculate keyboard size
        
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
               return
           }
        if notification.name == UIResponder.keyboardWillShowNotification ||
            notification.name == UIResponder.keyboardWillChangeFrameNotification {
            
            // Check if location is > (ViewHeight - KeyboardHeight - TextFieldOrViewHeight - Margin8)
            if(location > (self.view.frame.height - keyboardSize.height - tfvHeight - 8) ) {
                
                // Pull the screen up by location + TextFieldOrViewHeight + Margin8 - (ViewHeight - KeyboardHeight)
                let pullUp = location + tfvHeight + 8 - (self.view.frame.height - keyboardSize.height)
                
                // Pull the screen frame up by the calculated value
                view.frame.origin.y = CGFloat(-pullUp)
            }
        } else {
            
            // Reset the frame
            view.frame.origin.y = 0
        }
    }
}

extension UIResponder {

    private static weak var _currentFirstResponder: UIResponder?

    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(UIResponder.findFirstResponder(_:)), to: nil, from: nil, for: nil)

        return _currentFirstResponder
    }

    @objc func findFirstResponder(_ sender: Any) {
        UIResponder._currentFirstResponder = self
    }
}
