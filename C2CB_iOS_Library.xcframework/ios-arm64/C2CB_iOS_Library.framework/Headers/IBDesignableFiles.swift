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
 public class C2CSdkCustomView: UIView {
    
    
    @IBInspectable public var width: CGFloat = 0.0 {
            didSet {
                setupButtonLayoutConstraintWidth(width: width)
            }
        }

    @IBInspectable public var height: CGFloat = 0.0 {
            didSet {
                setupButtonLayoutConstraintHeight(height: height)
            }
        }
    
    
    @IBInspectable public var channel_id: String{
        get{
            return ""
            //self.channel_id
        }
        set (channel_id_value) {
            channel_Modes_API_Calling(channel_id: channel_id_value)
            UserDefaults.standard.set(channel_id_value, forKey: "channel_id")
        }
    }
    
    
    var preferences:C2CSdkPreferences?
    static var shared: C2CSdkCustomView = {
            let object = C2CSdkCustomView.init()
            return object
        }()
    
    let callBtns: UIButton = {
        let channel_id = UserDefaults.standard.value(forKey: "channel_id") as? String
        let call_Btn = UIButton(type: .system)
        ImageDownloader.downloadImage("https://dev-api-t10.vgroupinc.com/dev_c2c_p82/product/channel/ur/\(channel_id ?? "")/connect.png") {
              image, urlString in
                 if let imageObject = image {
                    // performing UI operation on main thread
                    DispatchQueue.main.async {
                      // imageView.image = imageObject
                        call_Btn.setImage(imageObject.withRenderingMode(.alwaysOriginal), for: .normal)
                    }
                 }
              }
        
        call_Btn.contentMode = .scaleAspectFit
        call_Btn.isHidden = true
        return call_Btn
    }()
    let smsBtns: UIButton = {
        let channel_id = UserDefaults.standard.value(forKey: "channel_id") as? String
        let sms_Btn = UIButton(type: .system)
        ImageDownloader.downloadImage("https://dev-api-t10.vgroupinc.com/dev_c2c_p82/product/channel/ur/\(channel_id ?? "")/sms.png") {
              image, urlString in
                 if let imageObject = image {
                    // performing UI operation on main thread
                    DispatchQueue.main.async {
                      // imageView.image = imageObject
                        
                        sms_Btn.setImage(imageObject.withRenderingMode(.alwaysOriginal), for: .normal)
                    }
                 }
              }
        sms_Btn.contentMode = .scaleAspectFit
        sms_Btn.isHidden = true
        return sms_Btn
    }()
    let emailBtns: UIButton = {
        let channel_id = UserDefaults.standard.value(forKey: "channel_id") as? String
        let email_Btn = UIButton(type: .system)
        ImageDownloader.downloadImage("https://dev-api-t10.vgroupinc.com/dev_c2c_p82/product/channel/ur/\(channel_id ?? "")/email.png") {
              image, urlString in
                 if let imageObject = image {
                    // performing UI operation on main thread
                    DispatchQueue.main.async {
                        email_Btn.setImage(imageObject.withRenderingMode(.alwaysOriginal), for: .normal)
                    }
                 }
              }
        email_Btn.contentMode = .scaleAspectFit
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
  private func setupButtons() {
            customViewStackView.addArrangedSubview(callBtns)
            callBtns.addTarget(self, action: #selector(actionOnCallBtn), for: .touchUpInside)
            customViewStackView.addArrangedSubview(smsBtns)
            smsBtns.addTarget(self, action: #selector(actionOnSmsBtn), for: .touchUpInside)
            customViewStackView.addArrangedSubview(emailBtns)
            emailBtns.addTarget(self, action: #selector(actionOnEmailBtn), for: .touchUpInside)
            addSubview(customViewStackView)
            //let value = UserDefaults.standard.value(forKey: "channel_id") as? String
    }
    
    private func setupButtonLayoutConstraintHeight(height:CGFloat){
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
        var responder: UIResponder? = self
          while let nextResponder = responder?.next {
              if let viewController = nextResponder as? UIViewController {
                  // Create and present the new view controller
                  let newViewController = C2CSdkCallValidationSetUp()
                  newViewController.call_preferences = C2CSdkCustomView.shared.preferences
                  viewController.present(newViewController, animated: true, completion: nil)
                  break
              }
              responder = nextResponder
          }
    }
    @objc private func actionOnSmsBtn(sender: UIButton!) {
        var responder: UIResponder? = self
          while let nextResponder = responder?.next {
              if let viewController = nextResponder as? UIViewController {
                  // Create and present the new view controller
                  let newViewController = C2CSdkSMSValidationSetUp()
                  newViewController.sms_preferences = C2CSdkCustomView.shared.preferences
                  viewController.present(newViewController, animated: true, completion: nil)
                  break
              }
              responder = nextResponder
          }
    }
    
    @objc private func actionOnEmailBtn(sender: UIButton!) {
        var responder: UIResponder? = self
          while let nextResponder = responder?.next {
              if let viewController = nextResponder as? UIViewController {
                  // Create and present the new view controller
                  let newViewController = C2CSdkEmailValidationSetUp()
                  newViewController.email_preferences = C2CSdkCustomView.shared.preferences
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
                   let email_data = C2CSdkConstant.jsonToData(json: email_status),
                   let call_data = C2CSdkConstant.jsonToData(json: call_status),
                   let sms_data = C2CSdkConstant.jsonToData(json: sms_status),
                   let preferences_data = C2CSdkConstant.jsonToData(json: preferences),
                   let email = try? JSONDecoder().decode(C2CSdkEmailstats.self, from: email_data),let call = try? JSONDecoder().decode(C2CSdkCallstats.self, from: call_data),let sms = try? JSONDecoder().decode(C2CSdkSmsstats.self, from: sms_data),let preference = try? JSONDecoder().decode(C2CSdkPreferences.self, from: preferences_data){
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
                        C2CSdkCustomView.shared.preferences = preference
                     
                    }
                    
                }
        })
    }
    
    public override func prepareForInterfaceBuilder() {
            super.prepareForInterfaceBuilder()
            setupButtons()
    }
   
}
