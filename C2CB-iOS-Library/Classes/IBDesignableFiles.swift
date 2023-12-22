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

extension UISearchBar{
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

@IBDesignable
class CustomView: UIView {
    @IBInspectable var channel_id: String{
        get{
            return self.channel_id
        }
        set (channel_id_value) {
            channel_Modes_API_Calling(channel_id: channel_id_value)
            print("channel_id",channel_id_value)
            UserDefaults.standard.set(channel_id_value, forKey: "channel_id")
        }
    }
    
    
    var preferences:Preferences?
    static var shared: CustomView = {
            let object = CustomView.init()
            return object
        }()
    //var channel_id_value:String?
    let callBtns: UIButton = {
        let call_Btn = UIButton(type: .system)
        let image = Constant.getImage(named: "call")?.withRenderingMode(.alwaysOriginal)
        call_Btn.setImage(image, for: .normal)
        call_Btn.contentMode = .scaleAspectFit
        call_Btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        call_Btn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        call_Btn.isHidden = true
        return call_Btn
    }()
    let smsBtns: UIButton = {
        let sms_Btn = UIButton(type: .system)
        let image = Constant.getImage(named: "sms")?.withRenderingMode(.alwaysOriginal)
        sms_Btn.setImage(image, for: .normal)
        sms_Btn.contentMode = .scaleAspectFit
        sms_Btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sms_Btn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        sms_Btn.isHidden = true
        return sms_Btn
    }()
    let emailBtns: UIButton = {
        let email_Btn = UIButton(type: .system)
        let image = Constant.getImage(named: "email")?.withRenderingMode(.alwaysOriginal)
        email_Btn.setImage(image, for: .normal)
        email_Btn.contentMode = .scaleAspectFit
        email_Btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        email_Btn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        email_Btn.isHidden = true
        return email_Btn
    }()
 
    private var customViewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 15
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButtons()
    }

    // Function to set up buttons and add actions
    func setupButtons() {
            customViewStackView.addArrangedSubview(callBtns)
            callBtns.addTarget(self, action: #selector(actionOnCallBtn), for: .touchUpInside)
            customViewStackView.addArrangedSubview(smsBtns)
            smsBtns.addTarget(self, action: #selector(actionOnSmsBtn), for: .touchUpInside)
            customViewStackView.addArrangedSubview(emailBtns)
            emailBtns.addTarget(self, action: #selector(actionOnEmailBtn), for: .touchUpInside)
            addSubview(customViewStackView)
            let value = UserDefaults.standard.value(forKey: "channel_id") as? String
            print("value>>>>>>>>>>>>>",value ?? "")
    }

    
    @objc private func actionOnCallBtn(sender: UIButton!) {
      print("actionOnCallBtn")
        var responder: UIResponder? = self
          while let nextResponder = responder?.next {
              if let viewController = nextResponder as? UIViewController {
                  // Create and present the new view controller
                  let newViewController = CallValidationSetUp()
                  newViewController.call_preferences = CustomView.shared.preferences
                  print("Pre>>>>>>>",CustomView.shared.preferences?.call_name ?? false)
                  viewController.present(newViewController, animated: true, completion: nil)
                  break
              }
              responder = nextResponder
          }
    }
    @objc private func actionOnSmsBtn(sender: UIButton!) {
      print("actionOnSmsBtn")
        var responder: UIResponder? = self
          while let nextResponder = responder?.next {
              if let viewController = nextResponder as? UIViewController {
                  // Create and present the new view controller
                  let newViewController = SMSValidationSetUp()
                  newViewController.sms_preferences = CustomView.shared.preferences
                  print("Pre>>>>>>>",CustomView.shared.preferences?.sms_name ?? false)
                  viewController.present(newViewController, animated: true, completion: nil)
                  break
              }
              responder = nextResponder
          }
    }
    
    @objc private func actionOnEmailBtn(sender: UIButton!) {
          print("actionOnEmailBtn")
        var responder: UIResponder? = self
          while let nextResponder = responder?.next {
              if let viewController = nextResponder as? UIViewController {
                  // Create and present the new view controller
                  let newViewController = EmailValidationSetUp()
                  newViewController.email_preferences = CustomView.shared.preferences
                  print("Pre>>>>>>>",CustomView.shared.preferences?.email_name ?? false)
                  viewController.present(newViewController, animated: true, completion: nil)
                  break
              }
              responder = nextResponder
          }
        
    }
   

    func channel_Modes_API_Calling(channel_id:String){
        API.get(Endpoint: .getChannelMode, parameter: channel_id, completion: {(response , error) in
            if let error = error{
                print("Error>>>>>",error)
                return
            }
            
                let channel = response!["channel"] as! EIDictonary
                if let email_status = channel["emailstats"],
                   let call_status = channel["callstats"],
                   let sms_status = channel["smsstats"],
                   let preferences = channel["preferences"],
                   let email_data = Constant.jsonToData(json: email_status),
                   let call_data = Constant.jsonToData(json: call_status),
                   let sms_data = Constant.jsonToData(json: sms_status),
                   let preferences_data = Constant.jsonToData(json: preferences),
                   let email = try? JSONDecoder().decode(Emailstats.self, from: email_data),let call = try? JSONDecoder().decode(Callstats.self, from: call_data),let sms = try? JSONDecoder().decode(Smsstats.self, from: sms_data),let preference = try? JSONDecoder().decode(Preferences.self, from: preferences_data){
                    print("email>>>>>>>>>>>>>>>",email.enable ?? false)
                    print("call>>>>>>>>>>>>>>>",call)
                    print("sms>>>>>>>>>>>>>>>",sms)
                    print("preference>>>>>>>>>>>>>>>",preference)
                    DispatchQueue.main.async {
                        if call.enable ?? false{
                            self.callBtns.isHidden = false
                        }
                        if email.enable ?? false{
                            self.emailBtns.isHidden = false
                        }
                        if sms.enable ?? false{
                            self.smsBtns.isHidden = false
                        }
                        CustomView.shared.preferences = preference
                     
                    }
                    
                }
        })
    }
    
    override func prepareForInterfaceBuilder() {
            super.prepareForInterfaceBuilder()
            setupButtons()
    }
   
}
