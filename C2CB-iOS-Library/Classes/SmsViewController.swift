//
//  SmsViewController.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 04/12/23.
//

import Foundation
open class SmsViewController:UIViewController{
    
    let containerView:UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 15
        return containerView
    }()
    
    
    let titlsLabel: UILabel = {
        let label = UILabel()
        label.text = "Compose New SMS"
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let toLabel: UILabel = {
        let label = UILabel()
        label.text = "To:"
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cancelButton: UIButton = {
        let cancelBtn = UIButton(type: .system)
        let image = Constant.getImage(named: "cancel")?.withRenderingMode(.alwaysOriginal)
        cancelBtn.setImage(image, for: .normal)
        cancelBtn.contentMode = .scaleAspectFit
        return cancelBtn
    }()
    
    let contactNumberTextField: UITextField = {
        let contactNoText = UITextField()
        contactNoText.placeholder = "Contact number"
        contactNoText.addDoneButtonOnKeyboard()
        contactNoText.keyboardType = .namePhonePad
        contactNoText.textColor = .black
        contactNoText.borderStyle = .roundedRect
        contactNoText.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return contactNoText
    }()
    
    let messageTextView: UITextView = {
        let messageTextView = UITextView()
        messageTextView.addDoneButtonOnKeyboard()
        messageTextView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        messageTextView.layer.borderWidth = 0.5
        messageTextView.layer.cornerRadius = 10
        return messageTextView
    }()
    let sendBtnView:GradientView = {
        let sendBtnView = GradientView()
        sendBtnView.startColor = EIColor.init(hexString: "#52ACDD")
        sendBtnView.endColor = #colorLiteral(red: 0.05882352941, green: 0.1254901961, blue: 0.2941176471, alpha: 1).withAlphaComponent(0.7)
        sendBtnView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        sendBtnView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        return sendBtnView
    }()
    let sendTextLbl: UILabel = {
        let label = UILabel()
        label.text = "Send"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let sendButton: UIButton = {
        let sendBtn = UIButton(type: .system)
        sendBtn.frame = CGRect(x: 0, y: 0, width: 310, height: 50)
        return sendBtn
    }()
    
    // MARK: - Private properties
    private var composeSMSStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    private let placeholderMess = "Enter your message.."
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
    }
    
    private func setupViews(){
        view.addSubview(containerView)
        self.DoneKeyboard(dismissOnTap: false)
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 430).isActive = true
        containerView.addSubview(cancelButton)
        cancelButton.frame = CGRect(x: 310, y: 10, width: 30, height: 30)
        containerView.addSubview(composeSMSStackView)
        composeSMSStackView.topAnchor.constraint(equalTo: cancelButton.topAnchor, constant: 30).isActive = true
        composeSMSStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        composeSMSStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        composeSMSStackView.addArrangedSubview(titlsLabel)
        // Set the font, color, and size
        titlsLabel.font = UIFont.boldSystemFont(ofSize: 22.0)
        titlsLabel.textColor = EIColor.init(hexString: "#52ACDD")
        composeSMSStackView.addArrangedSubview(toLabel)
        toLabel.font = UIFont.systemFont(ofSize: 18.0) // Set the font size
        toLabel.textColor = EIColor.init(hexString: "#52ACDD")
        composeSMSStackView.addArrangedSubview(contactNumberTextField)
        contactNumberTextField.font = UIFont.systemFont(ofSize: 18.0)
        composeSMSStackView.addArrangedSubview(messageTextView)
        messageTextView.font = UIFont.systemFont(ofSize: 17.0)
        composeSMSStackView.addArrangedSubview(sendBtnView)
        sendBtnView.addSubview(sendTextLbl)
        sendTextLbl.font = UIFont.boldSystemFont(ofSize: 22.0)
        sendBtnView.addSubview(sendButton)
        sendTextLbl.centerXAnchor.constraint(equalTo: sendBtnView.centerXAnchor).isActive = true
        sendTextLbl.centerYAnchor.constraint(equalTo: sendBtnView.centerYAnchor).isActive = true
        
        if #available(iOS 13.0, *) {
            messageTextView.textColor = UIColor.label
        } else {
            messageTextView.textColor = .black
        }
        cancelButton.addTarget(self, action: #selector(dismissSubView), for: .touchUpInside)
        sendButton.addTarget(self, action: #selector(dismissSubView), for: .touchUpInside)
        messageTextView.delegate = self
    }
    
    @objc private func dismissSubView(){
        dismiss(animated: true)
        print("dismissSubView")
        
    }
    
    
    
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        messageTextView.text = placeholderMess

    }
    
}
extension SmsViewController: UITextViewDelegate {

    public func textViewDidBeginEditing(_ textView: UITextView) {

        if !messageTextView.text!.isEmpty && messageTextView.text! == placeholderMess {
            messageTextView.text = ""
            messageTextView.textColor = .black
        }
    }

    public func textViewDidEndEditing(_ textView: UITextView) {
    
        if messageTextView.text.isEmpty {
            messageTextView.text = placeholderMess
            messageTextView.textColor = UIColor.lightGray
        }
    }
}
