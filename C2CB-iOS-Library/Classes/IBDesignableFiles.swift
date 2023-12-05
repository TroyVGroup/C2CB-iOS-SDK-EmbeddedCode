//
//  IBDesignableFiles.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 04/12/23.
//

import Foundation
import UIKit
@IBDesignable class CallingIcons: UIButton {
    
    @IBInspectable var cournerRadius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cournerRadius
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            self.layer.shadowOpacity = 0.2
            self.layer.shadowRadius = 4.0
            
        }
    }
    @IBInspectable var SetCustomIcon:UIImage? {
        didSet {
            self.setImage(SetCustomIcon, for: .normal)
            self.contentMode = .scaleAspectFit
            self.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        }
    }
    @objc func buttonAction(sender: UIButton!) {
      print("Button Call tapped")
    }
}
@IBDesignable class CallViewIcons: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCallIcon()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setCallIcon()
    }
    
    override func prepareForInterfaceBuilder() {
        setCallIcon()
    }
    func setCallIcon() {
        let image = Constant.getImage(named: "call")?.withRenderingMode(.alwaysOriginal)
        self.setBackgroundImage(image, for: .normal)
        self.contentMode = .scaleAspectFit
    }
}

@IBDesignable class SmsViewIcons: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSmsIcon()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setSmsIcon()
    }
    
    override func prepareForInterfaceBuilder() {
        setSmsIcon()
    }
    func setSmsIcon() {
        let image = Constant.getImage(named: "sms")?.withRenderingMode(.alwaysOriginal)
        self.setBackgroundImage(image, for: .normal)
        self.contentMode = .scaleAspectFit
    }
}

@IBDesignable class EmailViewIcons: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setEmailIcon()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setEmailIcon()
    }
    
    override func prepareForInterfaceBuilder() {
        setEmailIcon()
    }
    
    func setEmailIcon() {
        let image = Constant.getImage(named: "email")?.withRenderingMode(.alwaysOriginal)
        self.setBackgroundImage(image, for: .normal)
        self.contentMode = .scaleAspectFit
    }
}
extension UITextField{
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }

    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        self.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
}

extension UITextView{
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }

    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        self.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
}

extension UIViewController {

    public func DoneKeyboard(dismissOnTap:Bool) {
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
