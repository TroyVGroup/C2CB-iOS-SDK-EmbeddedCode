//
//  IBDesignableFiles.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 04/12/23.
//

import Foundation
import UIKit
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
    
    
    @IBInspectable var width: CGFloat = 0.0 {
            didSet {
                //updateSize()
                print("width>>>>>>",width)
                setupButtonLayoutConstraintWidth(width: width)
            }
        }

    @IBInspectable var height: CGFloat = 0.0 {
            didSet {
                //updateSize()
                print("height>>>>>>",height)
                setupButtonLayoutConstraintHeight(height: height)
            }
        }
    
    
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
        //call_Btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //call_Btn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        call_Btn.isHidden = true
        return call_Btn
    }()
    let smsBtns: UIButton = {
        let sms_Btn = UIButton(type: .system)
        let image = Constant.getImage(named: "sms")?.withRenderingMode(.alwaysOriginal)
        sms_Btn.setImage(image, for: .normal)
        sms_Btn.contentMode = .scaleAspectFit
        //sms_Btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //sms_Btn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        sms_Btn.isHidden = true
        return sms_Btn
    }()
    let emailBtns: UIButton = {
        let email_Btn = UIButton(type: .system)
        let image = Constant.getImage(named: "email")?.withRenderingMode(.alwaysOriginal)
        email_Btn.setImage(image, for: .normal)
        email_Btn.contentMode = .scaleAspectFit
        //email_Btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //email_Btn.widthAnchor.constraint(equalToConstant: 40).isActive = true
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
            print("Height",height)
            print("Width",width)
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
    
    private func setupButtonLayoutConstraintHeight(height:CGFloat){
        print("setupButtonLayoutConstraint")
        NSLayoutConstraint.activate([
            callBtns.heightAnchor.constraint(equalToConstant: height),
            smsBtns.heightAnchor.constraint(equalToConstant: height),
            emailBtns.heightAnchor.constraint(equalToConstant: height),
        ])
    }

    private func setupButtonLayoutConstraintWidth(width:CGFloat){
        NSLayoutConstraint.activate([
            callBtns.widthAnchor.constraint(equalToConstant: width),
            smsBtns.widthAnchor.constraint(equalToConstant: width),
            emailBtns.widthAnchor.constraint(equalToConstant: width)
            ])
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
