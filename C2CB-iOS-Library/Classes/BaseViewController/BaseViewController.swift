//
//  BaseViewController.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 20/12/23.
//

import Foundation
open class BaseViewController:UIViewController{
    let containerView:UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 15
        return containerView
    }()
    let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            return scrollView
        }()
    let cancelButton: UIButton = {
        let cancelBtn = UIButton(type: .system)
        let image = Constant.getImage(named: "cancel")?.withRenderingMode(.alwaysOriginal)
        cancelBtn.setImage(image, for: .normal)
        cancelBtn.contentMode = .scaleAspectFit
        return cancelBtn
    }()
    let titleLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Call"
        lbl.textAlignment = .center
        lbl.adjustsFontForContentSizeCategory = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return lbl
    }()
    let firstLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "First name"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.adjustsFontForContentSizeCategory = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return lbl
    }()
    let firstText:UITextField = {
        let text = UITextField()
        text.placeholder = "Enter first name"
        text.addDoneButtonOnKeyboard()
        text.keyboardType = .default
        text.textColor = .black
        text.borderStyle = .roundedRect
        text.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return text
    }()
    
    let firstNameStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    let lastLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Last name"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.adjustsFontForContentSizeCategory = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return lbl
    }()
    let lastText:UITextField = {
        let text = UITextField()
        text.placeholder = "Enter last name"
        text.addDoneButtonOnKeyboard()
        text.keyboardType = .default
        text.textColor = .black
        text.borderStyle = .roundedRect
        text.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return text
    }()
    let lastNameStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    let countryCodeLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Country code."
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.adjustsFontForContentSizeCategory = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return lbl
    }()
    let countryCodeText:UITextField = {
        let text = UITextField()
        text.placeholder = "Select Country code"
        //text.addDoneButtonOnKeyboard()
       // text.keyboardType = .numberPad
        text.textColor = .black
        text.borderStyle = .roundedRect
        text.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return text
    }()
    let countryCodeDropDownImage:UIImageView = {
        let image = UIImageView()
        //image.image = Constant.getImage(named: "call")?.withRenderingMode(.alwaysOriginal)
        if #available(iOS 13.0, *) {
            image.image = UIImage(systemName: "arrowtriangle.down.fill")
        } else {
            // Fallback on earlier versions
        }
        image.tintColor = .gray
        image.contentMode = .scaleAspectFit
        return image
    }()
    let countrySelectedButton: UIButton = {
        let countryselectedBtn = UIButton(type: .system)
        countryselectedBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        return countryselectedBtn
    }()
    
    let mobileCountryStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        stackView.spacing = 0
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    let mobileNumberLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Contact Number"
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.adjustsFontForContentSizeCategory = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return lbl
    }()
    let mobileText:UITextField = {
        let text = UITextField()
        text.placeholder = "Contact number"
        text.addDoneButtonOnKeyboard()
        text.keyboardType = .numberPad
        text.textColor = .black
        text.borderStyle = .roundedRect
        text.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return text
    }()
    let mobileNumberStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    let contactCodeLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Code"
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.adjustsFontForContentSizeCategory = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let contactCodeBtn:UIButton = {
        let codeBtn = UIButton(type: .system)
        codeBtn.setTitle("Code", for: .normal)
        codeBtn.backgroundColor = .white
        codeBtn.setTitleColor(EIColor.init(hexString: "#52ACDD"), for: .normal)
        codeBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        codeBtn.layer.cornerRadius = 10
        codeBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return codeBtn
    }()
    
    let contactCodeStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    let mobileNumberVerificationCodeLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Enter Verification Code for Mobile Number"
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.adjustsFontForContentSizeCategory = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //lbl.isHidden = true
        return lbl
    }()
    let mobileVerificationCodeText:UITextField = {
        let text = UITextField()
        text.placeholder = "Enter Verification Code for Mobile Number"
        text.addDoneButtonOnKeyboard()
        text.keyboardType = .numberPad
        text.textColor = .black
        text.borderStyle = .roundedRect
        text.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //text.isHidden = true
        return text
    }()
    let callOtpVerifyImage:UIImageView = {
        let image = UIImageView()
        //checkmark.seal.fill
        if #available(iOS 13.0, *) {
            image.image = UIImage(systemName: "checkmark.seal.fill")
        } else {
            // Fallback on earlier versions
        }
        image.tintColor = .green
        image.contentMode = .scaleAspectFit
        image.isHidden = true
        return image
    }()
    let mobileNumberVerificationStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        //stackView.isHidden = true
        return stackView
    }()
    let emailText:UITextField = {
        let text = UITextField()
        text.placeholder = "Email Address"
        text.addDoneButtonOnKeyboard()
        text.keyboardType = .emailAddress
        text.autocapitalizationType = .none
        text.textColor = .black
        text.borderStyle = .roundedRect
        text.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return text
    }()
    let emailVerifyBtn:UIButton = {
        let codeBtn = UIButton(type: .system)
        codeBtn.setTitle("Verify", for: .normal)
        codeBtn.backgroundColor = .white
        codeBtn.setTitleColor(EIColor.init(hexString: "#52ACDD"), for: .normal)
        codeBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        codeBtn.layer.cornerRadius = 10
        codeBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return codeBtn
    }()
    let emailVerificationCodeLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Enter Verification Code for Email Address"
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.adjustsFontForContentSizeCategory = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return lbl
    }()
    let emailVerificationCodeText:UITextField = {
        let text = UITextField()
        text.placeholder = "Enter Verification Code for Email Address"
        text.addDoneButtonOnKeyboard()
        text.keyboardType = .numberPad
        text.textColor = .black
        text.borderStyle = .roundedRect
        text.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return text
    }()
    let emailOtpVerifyImage:UIImageView = {
        let image = UIImageView()
        if #available(iOS 13.0, *) {
            image.image = UIImage(systemName: "checkmark.seal.fill")
        } else {
            // Fallback on earlier versions
        }
        image.tintColor = .green
        image.contentMode = .scaleAspectFit
        image.isHidden = true
        return image
    }()
    let emailVerificationStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        //stackView.isHidden = true
        return stackView
    }()
    let call_messageTextView: UITextView = {
        let messageTextView = UITextView()
        messageTextView.addDoneButtonOnKeyboard()
        messageTextView.keyboardType = .default
        messageTextView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        messageTextView.layer.borderWidth = 0.5
        messageTextView.layer.cornerRadius = 10
        return messageTextView
    }()
    let sms_messageTextView: UITextView = {
        let messageTextView = UITextView()
        messageTextView.addDoneButtonOnKeyboard()
        messageTextView.keyboardType = .default
        messageTextView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        messageTextView.layer.borderWidth = 0.5
        messageTextView.layer.cornerRadius = 10
        return messageTextView
    }()
    let sms_message_characterCountLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "0/160"
        lbl.textColor = UIColor.red
        lbl.textAlignment = .right
        lbl.adjustsFontForContentSizeCategory = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
       // lbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
       // lbl.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return lbl
    }()
    let email_messageTextView: UITextView = {
        let messageTextView = UITextView()
        messageTextView.addDoneButtonOnKeyboard()
        messageTextView.keyboardType = .default
        messageTextView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        messageTextView.layer.borderWidth = 0.5
        messageTextView.layer.cornerRadius = 10
        return messageTextView
    }()
    let checkBoxBtn:UIButton = {
      let btn = UIButton(type: .system)
        let image = Constant.getImage(named: "unChecked")?.withRenderingMode(.alwaysOriginal)
        btn.setImage(image, for: .normal)
        btn.contentMode = .scaleAspectFit
        btn.tintColor = .clear
        btn.heightAnchor.constraint(equalToConstant: 20).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return btn
    }()
    let agreeLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "I agree to the"
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.adjustsFontForContentSizeCategory = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let termsAndConditonBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.titleLabel?.textAlignment = .left
        btn.setTitle("terms and condition.", for: .normal)
        btn.setTitleColor(EIColor.init(hexString: "#52ACDD"), for: .normal)
        return btn
    }()
    
    let connectButton: UIButton = {
        let connect = UIButton(type: .system)
        connect.setTitle("Connect", for: .normal)
        connect.backgroundColor = EIColor.init(hexString: "#52ACDD")
        connect.setTitleColor(.black, for: .normal)
        connect.heightAnchor.constraint(equalToConstant: 40).isActive = true
        connect.layer.cornerRadius = 10
        connect.isUserInteractionEnabled = false
        return connect
    }()
    let poweredByLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Powered by:"
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.adjustsFontForContentSizeCategory = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let contextToCallBtn:UIButton = {
      let btn = UIButton(type: .system)
        btn.setTitle("contexttocall.com", for: .normal)
        btn.setTitleColor(EIColor.init(hexString: "#52ACDD"), for: .normal)
        return btn
    }()
    
    
    let nameSectionStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    let mobileSectionStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    let emailSectionStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    let termsSectionStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    let poweredBySectionStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    let layoutStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    let placeholderMess = "Enter message.."
    let screenSize = UIScreen.main.bounds
    var temp_variable = 0
    var container_view_height:CGFloat = 200
    var call_preferences : Preferences?
    var sms_preferences : Preferences?
    var email_preferences : Preferences?
    var countdownTimer: Timer?
    var secondsRemaining = 60
    
    
//    open override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        DoneKeyboard(dismissOnTap: true)
//    }
    
    
    
//MARK: - CALL SetupUI
    func setUpCall_ValidationPage(){
        //MARK: - Container
        view.addSubview(containerView)
        print("screenSize.width-40",containerView.bounds.size.width)
        print("screenSize.height-40",containerView.bounds.size.height)
        containerView.backgroundColor = .gray
        NSLayoutConstraint.activate([
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        //MARK: - cancel Button
        containerView.addSubview(cancelButton)
        cancelButton.frame = CGRect(x: containerView.bounds.size.width-40, y: 10, width: 30, height: 30)
        //MARK: - Call title Label
        containerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
        ])
        titleLabel.textColor = .white
        //MARK: - Call Stack View
        containerView.addSubview(layoutStackView)
        NSLayoutConstraint.activate([
        layoutStackView.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 40),
        layoutStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        layoutStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])
        //MARK: - Name
        firstNameStackView.addArrangedSubview(firstLabel)
        firstNameStackView.addArrangedSubview(firstText)
        lastNameStackView.addArrangedSubview(lastLabel)
        lastNameStackView.addArrangedSubview(lastText)
        nameSectionStackView.addArrangedSubview(firstNameStackView)
        nameSectionStackView.addArrangedSubview(lastNameStackView)
        let textWidth = (containerView.bounds.size.width-48) / 2
        print("textWidth",textWidth)
        NSLayoutConstraint.activate([
        firstText.widthAnchor.constraint(equalToConstant: textWidth),
        lastText.widthAnchor.constraint(equalToConstant: textWidth)
        ])
        //MARK: - Mobile
        //Country Code
        mobileCountryStackView.addArrangedSubview(countryCodeLabel)
        mobileCountryStackView.addArrangedSubview(countryCodeText)
        countryCodeText.addSubview(countryCodeDropDownImage)
        countryCodeDropDownImage.frame = CGRect(x: countryCodeText.bounds.size.width-15, y: 15, width: 10, height: 10)
        countryCodeText.addSubview(countrySelectedButton)
        //Contact Number
        mobileNumberStackView.addArrangedSubview(mobileNumberLabel)
        mobileNumberStackView.addArrangedSubview(mobileText)
        //Code Verify Btn
        
        contactCodeStackView.addArrangedSubview(contactCodeLabel)
        contactCodeStackView.addArrangedSubview(contactCodeBtn)
        mobileSectionStackView.addArrangedSubview(mobileCountryStackView)
        mobileSectionStackView.addArrangedSubview(mobileNumberStackView)
        if call_preferences?.call_verifycontact ?? false{
        mobileSectionStackView.addArrangedSubview(contactCodeStackView)
        }
        //Verify Mobile Number
        mobileNumberVerificationStackView.addArrangedSubview(mobileNumberVerificationCodeLabel)
        mobileNumberVerificationStackView.addArrangedSubview(mobileVerificationCodeText)
        mobileVerificationCodeText.addSubview(callOtpVerifyImage)
        callOtpVerifyImage.frame = CGRect(x: mobileVerificationCodeText.bounds.size.width-30, y: 10, width: 20, height: 20)

        //MARK: - Email
        emailSectionStackView.addArrangedSubview(emailText)
        if call_preferences?.call_verifyemail ?? false{
            emailSectionStackView.addArrangedSubview(emailVerifyBtn)
        }
        //Verify Email Address
        
        emailVerificationStackView.addArrangedSubview(emailVerificationCodeLabel)
        emailVerificationStackView.addArrangedSubview(emailVerificationCodeText)
        
        emailVerificationCodeText.addSubview(emailOtpVerifyImage)
        emailOtpVerifyImage.frame = CGRect(x: emailVerificationCodeText.bounds.size.width-30, y: 10, width: 20, height: 20)
        //MARK: - Terms & Condition
        termsSectionStackView.addArrangedSubview(checkBoxBtn)
        checkBoxBtn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        termsSectionStackView.addArrangedSubview(agreeLabel)
        termsSectionStackView.addArrangedSubview(termsAndConditonBtn)
        //MARK: - Powered By
        poweredBySectionStackView.addArrangedSubview(poweredByLabel)
        poweredBySectionStackView.addArrangedSubview(contextToCallBtn)
        // Set All Filed by Stack View/ Auto Layout

        if call_preferences?.call_name ?? false{
            layoutStackView.addArrangedSubview(nameSectionStackView)
            container_view_height = container_view_height + 62
        }
        if call_preferences?.call_contact ?? false{
            layoutStackView.addArrangedSubview(mobileSectionStackView)
            container_view_height = container_view_height + 62
        }
        if call_preferences?.call_verifycontact ?? false{
                layoutStackView.addArrangedSubview(mobileNumberVerificationStackView)
                container_view_height = container_view_height + 62
        }
        if call_preferences?.call_email ?? false {
            layoutStackView.addArrangedSubview(emailSectionStackView)
            container_view_height = container_view_height + 62
        }
        if call_preferences?.call_verifyemail ?? false{
                layoutStackView.addArrangedSubview(emailVerificationStackView)
                container_view_height = container_view_height + 62
        }
        if call_preferences?.call_message ?? false{
            layoutStackView.addArrangedSubview(call_messageTextView)
            container_view_height = container_view_height + 150
        }
        containerView.addSubview(termsSectionStackView)
        NSLayoutConstraint.activate([
        termsSectionStackView.bottomAnchor.constraint(equalTo: layoutStackView.bottomAnchor, constant: 30),
        termsSectionStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
        ])

        containerView.addSubview(connectButton)
        connectButton.frame = CGRect(x: 20, y: containerView.bounds.size.height-80, width: containerView.bounds.size.width-45, height: 40)
        NSLayoutConstraint.activate([
        connectButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        connectButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 20)
        ])
        containerView.addSubview(poweredBySectionStackView)
        NSLayoutConstraint.activate([
        poweredBySectionStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
        poweredBySectionStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        containerView.heightAnchor.constraint(equalToConstant: container_view_height)
        ])
        //containerView.addSubview(verifyImage)
        setUpFontSizeInCallBackForm()
    }
    
    
//MARK: - SMS SetupUI
    func setUpSMS_ValidationPage(){
        //MARK: - Container
        view.addSubview(containerView)
        print("screenSize.width-40",containerView.bounds.size.width)
        print("screenSize.height-40",containerView.bounds.size.height)
        containerView.backgroundColor = .gray
        NSLayoutConstraint.activate([
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
       
        //MARK: - cancel Button
        containerView.addSubview(cancelButton)
        cancelButton.frame = CGRect(x: containerView.bounds.size.width-40, y: 10, width: 30, height: 30)
        //MARK: - Call title Label
        containerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
        ])
        titleLabel.textColor = .white
        //MARK: - Call Stack View
        containerView.addSubview(layoutStackView)
        NSLayoutConstraint.activate([
        layoutStackView.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 40),
        layoutStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        layoutStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])
        //MARK: - Name
        firstNameStackView.addArrangedSubview(firstLabel)
        firstNameStackView.addArrangedSubview(firstText)
        lastNameStackView.addArrangedSubview(lastLabel)
        lastNameStackView.addArrangedSubview(lastText)
        nameSectionStackView.addArrangedSubview(firstNameStackView)
        nameSectionStackView.addArrangedSubview(lastNameStackView)
        let textWidth = (containerView.bounds.size.width-48) / 2
        print("textWidth",textWidth)
        NSLayoutConstraint.activate([
        firstText.widthAnchor.constraint(equalToConstant: textWidth),
        lastText.widthAnchor.constraint(equalToConstant: textWidth)
        ])
        //MARK: - Mobile
        //Country Code
        mobileCountryStackView.addArrangedSubview(countryCodeLabel)
        mobileCountryStackView.addArrangedSubview(countryCodeText)
        countryCodeText.addSubview(countryCodeDropDownImage)
        countryCodeDropDownImage.frame = CGRect(x: countryCodeText.bounds.size.width-15, y: 15, width: 10, height: 10)
        countryCodeText.addSubview(countrySelectedButton)
        //Contact Number
        mobileNumberStackView.addArrangedSubview(mobileNumberLabel)
        mobileNumberStackView.addArrangedSubview(mobileText)
        //Code Verify Btn
        contactCodeStackView.addArrangedSubview(contactCodeLabel)
        contactCodeStackView.addArrangedSubview(contactCodeBtn)
        mobileSectionStackView.addArrangedSubview(mobileCountryStackView)
        mobileSectionStackView.addArrangedSubview(mobileNumberStackView)
        if sms_preferences?.sms_verifycontact ?? false{
            mobileSectionStackView.addArrangedSubview(contactCodeStackView)
        }
        //Verify Mobile Number
        mobileNumberVerificationStackView.addArrangedSubview(mobileNumberVerificationCodeLabel)
        mobileNumberVerificationStackView.addArrangedSubview(mobileVerificationCodeText)
        
        mobileVerificationCodeText.addSubview(callOtpVerifyImage)
        callOtpVerifyImage.frame = CGRect(x: mobileVerificationCodeText.bounds.size.width-30, y: 10, width: 20, height: 20)
        
        //MARK: - Email
        emailSectionStackView.addArrangedSubview(emailText)
        if sms_preferences?.sms_verifyemail ?? false{
            emailSectionStackView.addArrangedSubview(emailVerifyBtn)
        }
        //Verify Email Address
        emailVerificationStackView.addArrangedSubview(emailVerificationCodeLabel)
        emailVerificationStackView.addArrangedSubview(emailVerificationCodeText)
        
        emailVerificationCodeText.addSubview(emailOtpVerifyImage)
        emailOtpVerifyImage.frame = CGRect(x: emailVerificationCodeText.bounds.size.width-30, y: 10, width: 20, height: 20)
        //MARK: - Terms & Condition
        termsSectionStackView.addArrangedSubview(checkBoxBtn)
        checkBoxBtn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        termsSectionStackView.addArrangedSubview(agreeLabel)
        termsSectionStackView.addArrangedSubview(termsAndConditonBtn)
        //MARK: - Powered By
        poweredBySectionStackView.addArrangedSubview(poweredByLabel)
        poweredBySectionStackView.addArrangedSubview(contextToCallBtn)
        // Set All Filed by Stack View/ Auto Layout
        if sms_preferences?.sms_name ?? false{
            layoutStackView.addArrangedSubview(nameSectionStackView)
            container_view_height = container_view_height + 62
        }
        if sms_preferences?.sms_contact ?? false{
            layoutStackView.addArrangedSubview(mobileSectionStackView)
            container_view_height = container_view_height + 62
        }
        if sms_preferences?.sms_verifycontact ?? false{
            layoutStackView.addArrangedSubview(mobileNumberVerificationStackView)
            container_view_height = container_view_height + 62
        }
        if sms_preferences?.sms_email ?? false{
            layoutStackView.addArrangedSubview(emailSectionStackView)
            container_view_height = container_view_height + 62
        }
        if sms_preferences?.sms_verifycontact ?? false{
            layoutStackView.addArrangedSubview(emailVerificationStackView)
            container_view_height = container_view_height + 62
        }
       
    
       // if sms_preferences?.sms_message ?? false{
        layoutStackView.addArrangedSubview(sms_messageTextView)
        container_view_height = container_view_height + 150
        
        containerView.addSubview(sms_message_characterCountLabel)
        NSLayoutConstraint.activate([
        sms_message_characterCountLabel.topAnchor.constraint(equalTo: sms_messageTextView.bottomAnchor, constant: -30),
        sms_message_characterCountLabel.trailingAnchor.constraint(equalTo: sms_messageTextView.trailingAnchor, constant: -10)
        ])
        
        containerView.addSubview(termsSectionStackView)
        NSLayoutConstraint.activate([
        termsSectionStackView.bottomAnchor.constraint(equalTo: layoutStackView.bottomAnchor, constant: 30),
        termsSectionStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
        ])
        
        containerView.addSubview(connectButton)
        connectButton.frame = CGRect(x: 20, y: containerView.bounds.size.height-80, width: containerView.bounds.size.width-45, height: 40)
        NSLayoutConstraint.activate([
        connectButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        connectButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 20)
        ])
        containerView.addSubview(poweredBySectionStackView)
        NSLayoutConstraint.activate([
        poweredBySectionStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
        poweredBySectionStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        containerView.heightAnchor.constraint(equalToConstant: container_view_height)
        ])
        setUpFontSizeInCallBackForm()
    }
    
    
//MARK: - EMAIL SetupUI
    func setUpEmail_ValidationPage(){
        //MARK: - Container
        view.addSubview(containerView)
        print("screenSize.width-40",containerView.bounds.size.width)
        print("screenSize.height-40",containerView.bounds.size.height)
        containerView.backgroundColor = .gray
        NSLayoutConstraint.activate([
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        containerView.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                    scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                    scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                    scrollView.topAnchor.constraint(equalTo: containerView.topAnchor),
                    scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        //MARK: - cancel Button
        scrollView.addSubview(cancelButton)
        cancelButton.frame = CGRect(x: containerView.bounds.size.width-40, y: 10, width: 30, height: 30)
        //MARK: - Call title Label
        scrollView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
        ])
        titleLabel.textColor = .white
        //MARK: - Call Stack View
        scrollView.addSubview(layoutStackView)
        NSLayoutConstraint.activate([
        layoutStackView.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 40),
        layoutStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        layoutStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])
        //MARK: - Name
        firstNameStackView.addArrangedSubview(firstLabel)
        firstNameStackView.addArrangedSubview(firstText)
        lastNameStackView.addArrangedSubview(lastLabel)
        lastNameStackView.addArrangedSubview(lastText)
        nameSectionStackView.addArrangedSubview(firstNameStackView)
        nameSectionStackView.addArrangedSubview(lastNameStackView)
        let textWidth = (containerView.bounds.size.width-48) / 2
        print("textWidth",textWidth)
        NSLayoutConstraint.activate([
        firstText.widthAnchor.constraint(equalToConstant: textWidth),
        lastText.widthAnchor.constraint(equalToConstant: textWidth)
        ])
        //MARK: - Mobile
        //Country Code
        mobileCountryStackView.addArrangedSubview(countryCodeLabel)
        mobileCountryStackView.addArrangedSubview(countryCodeText)
        countryCodeText.addSubview(countryCodeDropDownImage)
        countryCodeDropDownImage.frame = CGRect(x: countryCodeText.bounds.size.width-15, y: 15, width: 10, height: 10)
        countryCodeText.addSubview(countrySelectedButton)
        //Contact Number
        mobileNumberStackView.addArrangedSubview(mobileNumberLabel)
        mobileNumberStackView.addArrangedSubview(mobileText)
        //Code Verify Btn
        contactCodeStackView.addArrangedSubview(contactCodeLabel)
        contactCodeStackView.addArrangedSubview(contactCodeBtn)
        mobileSectionStackView.addArrangedSubview(mobileCountryStackView)
        mobileSectionStackView.addArrangedSubview(mobileNumberStackView)
        if email_preferences?.email_verifycontact ?? false{
        mobileSectionStackView.addArrangedSubview(contactCodeStackView)
        }
       // mobileSectionStackView.addArrangedSubview(contactCodeStackView)
        //Verify Mobile Number
        mobileNumberVerificationStackView.addArrangedSubview(mobileNumberVerificationCodeLabel)
        mobileNumberVerificationStackView.addArrangedSubview(mobileVerificationCodeText)
        mobileVerificationCodeText.addSubview(callOtpVerifyImage)
        callOtpVerifyImage.frame = CGRect(x: mobileVerificationCodeText.bounds.size.width-30, y: 10, width: 20, height: 20)
        //MARK: - Email
        emailSectionStackView.addArrangedSubview(emailText)
        if email_preferences?.email_verifyemail ?? false{
            emailSectionStackView.addArrangedSubview(emailVerifyBtn)
        }
        //emailSectionStackView.addArrangedSubview(emailVerifyBtn)
        //Verify Email Address
        emailVerificationStackView.addArrangedSubview(emailVerificationCodeLabel)
        emailVerificationStackView.addArrangedSubview(emailVerificationCodeText)
        
        emailVerificationCodeText.addSubview(emailOtpVerifyImage)
        emailOtpVerifyImage.frame = CGRect(x: emailVerificationCodeText.bounds.size.width-30, y: 10, width: 20, height: 20)
        //MARK: - Terms & Condition
        termsSectionStackView.addArrangedSubview(checkBoxBtn)
        checkBoxBtn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        termsSectionStackView.addArrangedSubview(agreeLabel)
        termsSectionStackView.addArrangedSubview(termsAndConditonBtn)
        //MARK: - Powered By
        poweredBySectionStackView.addArrangedSubview(poweredByLabel)
        poweredBySectionStackView.addArrangedSubview(contextToCallBtn)
        // Set All Filed by Stack View/ Auto Layout
        if email_preferences?.email_name ?? false{
            layoutStackView.addArrangedSubview(nameSectionStackView)
            //container_view_height = container_view_height + 62
        }
        if email_preferences?.email_contact ?? false{
            layoutStackView.addArrangedSubview(mobileSectionStackView)
           // container_view_height = container_view_height + 62
        }
        if email_preferences?.email_verifycontact ?? false{
            //if mobileNumberVerificationStackView.isHidden == false{
                layoutStackView.addArrangedSubview(mobileNumberVerificationStackView)
               // container_view_height = container_view_height + 62
           // }
        }
        if email_preferences?.email_email ?? false{
            layoutStackView.addArrangedSubview(emailSectionStackView)
            //container_view_height = container_view_height + 62
        }
        if email_preferences?.email_verifyemail ?? false{
                layoutStackView.addArrangedSubview(emailVerificationStackView)
                //container_view_height = container_view_height + 62
        }
       // if email_preferences?.email_message ?? false {
            layoutStackView.addArrangedSubview(email_messageTextView)
            //container_view_height = container_view_height + 150
       // }
        
        scrollView.addSubview(termsSectionStackView)
        NSLayoutConstraint.activate([
        termsSectionStackView.bottomAnchor.constraint(equalTo: layoutStackView.bottomAnchor, constant: 30),
        termsSectionStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
        ])
        
        scrollView.addSubview(connectButton)
        connectButton.frame = CGRect(x: 20, y: scrollView.bounds.size.height-100, width: containerView.bounds.size.width-45, height: 40)
        NSLayoutConstraint.activate([
        //connectButton.bottomAnchor.constraint(equalTo: termsSectionStackView.bottomAnchor, constant: 30),
        connectButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        connectButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 20)
        ])
        scrollView.addSubview(poweredBySectionStackView)
        NSLayoutConstraint.activate([
        poweredBySectionStackView.topAnchor.constraint(equalTo: termsSectionStackView.bottomAnchor, constant: 70),
        poweredBySectionStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        scrollView.heightAnchor.constraint(lessThanOrEqualToConstant: 800),
        poweredBySectionStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
        setUpFontSizeInCallBackForm()
    }
    
    
    
    
    
    
    func setUpFontSizeInCallBackForm(){
        // Set Font Size
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        firstLabel.font = UIFont.systemFont(ofSize: 13.0)
        firstText.font = UIFont.systemFont(ofSize: 13.0)
        lastLabel.font = UIFont.systemFont(ofSize: 13.0)
        lastText.font = UIFont.systemFont(ofSize: 13.0)
        countryCodeLabel.font = UIFont.systemFont(ofSize: 13.0)
        countryCodeText.font = UIFont.systemFont(ofSize: 13.0)
        mobileNumberLabel.font = UIFont.systemFont(ofSize: 13.0)
        mobileText.font = UIFont.systemFont(ofSize: 13.0)
        
        contactCodeLabel.font = UIFont.systemFont(ofSize: 13.0)
        contactCodeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        
        mobileNumberVerificationCodeLabel.font = UIFont.systemFont(ofSize: 13.0)
        mobileVerificationCodeText.font = UIFont.systemFont(ofSize: 13.0)
        emailText.font = UIFont.systemFont(ofSize: 13.0)
        emailVerifyBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        
        emailVerificationCodeLabel.font = UIFont.systemFont(ofSize: 13.0)
        emailVerificationCodeText.font = UIFont.systemFont(ofSize: 13.0)
        
        call_messageTextView.font = UIFont.systemFont(ofSize: 13.0)
        sms_messageTextView.font = UIFont.systemFont(ofSize: 13.0)
        email_messageTextView.font = UIFont.systemFont(ofSize: 13.0)
        agreeLabel.font = UIFont.systemFont(ofSize: 13.0)
        poweredByLabel.font = UIFont.systemFont(ofSize: 13.0)
        termsAndConditonBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        contextToCallBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        connectButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    //MARK: -
    //MARK: - API CALLING
    
    //MARK: - Send Otp By Contact Number
    func sendOtpByContactNo(channel_id:String,contact_no:String,country_code:String){
        let param = [ApiParaKey.send_SMS_Otp.channelid : channel_id,ApiParaKey.send_SMS_Otp.countrycode:country_code,ApiParaKey.send_SMS_Otp.number:contact_no] as! EIDictonary
        API.post(Endpoint: .sendSMSOtp, parameter: param,completion: {
            (response , error) in
                if let error = error{
                    print("Error",error)
                    showAlert(title: "Error", message: error, view: self)
                    self.countdownTimer?.invalidate()
                    self.contactCodeBtn.isEnabled = true
                    self.contactCodeBtn.setTitle("Code", for: .normal)
                    return
                }
            if let status = response?["status"] as? NSNumber{
                if status == 200{
                    DispatchQueue.main.async { [weak self] in
                        showAlert(title: "Success", message: response?["message"] as? String ?? "", view: self!)
                       // self.mobileNumberVerificationStackView.isHidden = false
                    }
                }
            }
            
            
        })
        
    }
    
    //MARK: - Verify Otp Given By Contact Number
    func verifyOtpByContactNo(channel_id:String,contact_no:String,country_code:String,otp:String){
        let param = [ApiParaKey.sms_verify_Otp.channelid : channel_id,ApiParaKey.sms_verify_Otp.countrycode:country_code,ApiParaKey.sms_verify_Otp.number:contact_no,ApiParaKey.sms_verify_Otp.otp:otp] as! EIDictonary
        API.post(Endpoint: .smsVerifyOtp, parameter: param,completion: {
            (response , error) in
                if let error = error{
                    print("Error",error)
                    showAlert(title: "Error", message: error, view: self)
                    
                    return
                }
            if let status = response?["status"] as? NSNumber{
                if status == 200{
                    DispatchQueue.main.async {
                        self.callOtpVerifyImage.isHidden = false
                        self.countdownTimer?.invalidate()
                        self.contactCodeBtn.setTitle("Verified", for: .normal)
                        self.contactCodeBtn.isUserInteractionEnabled = true
                    }
                }
            }
            
            
        })
        
    }
    //MARK: - Send Otp By Email Address
    func sendOtpByEmailAddress(channel_id:String,email_id:String){
        let param = [ApiParaKey.send_Email_Otp.channelid : channel_id,ApiParaKey.send_Email_Otp.email:email_id] as! EIDictonary
        API.post(Endpoint: .sendEmailOtp, parameter: param,completion: {
            (response , error) in
                if let error = error{
                    print("Error",error)
                    showAlert(title: "Error", message: error, view: self)
                    self.countdownTimer?.invalidate()
                    self.emailVerifyBtn.isEnabled = true
                    self.emailVerifyBtn.setTitle("Verify", for: .normal)
                    return
                }
            if let status = response?["status"] as? NSNumber{
                if status == 200{
                    DispatchQueue.main.async { [weak self] in
                        showAlert(title: "Success", message: response?["message"] as? String ?? "", view: self!)
                       // self.mobileNumberVerificationStackView.isHidden = false
                    }
                }
            }
            
            
        })
        
    }
    
    //MARK: - Verify Otp Given By Email Address
    func verifyOtpGivenByEmailAddress(channel_id:String,email_id:String,otp:String){
        let param = [ApiParaKey.send_Email_Verify_Otp.channelid : channel_id,ApiParaKey.send_Email_Verify_Otp.email:email_id,ApiParaKey.send_Email_Verify_Otp.otp:otp] as! EIDictonary
        print("verifyOtpGivenByEmailAddress_param>>>>",param)
        API.post(Endpoint: .sendEmailVerifyOtp, parameter: param,completion: {
            (response , error) in
                if let error = error{
                    print("Error",error)
                    showAlert(title: "Error", message: error, view: self)
                    return
                }
            if let status = response?["status"] as? NSNumber{
                if status == 200{
                    DispatchQueue.main.async {
                        self.emailOtpVerifyImage.isHidden = false
                        self.countdownTimer?.invalidate()
                        self.emailVerifyBtn.setTitle("Verified", for: .normal)
                        self.emailVerifyBtn.isUserInteractionEnabled = true
                    }
                }
            }
            
            
        })
        
    }
}
