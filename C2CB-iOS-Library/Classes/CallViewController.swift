//
//  CallViewController.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 06/12/23.
//

import Foundation
open class CallViewController:UIViewController{
    
    let userImage:UIImageView = {
        let user_image = UIImageView()
        let image = Constant.getImage(named: "unknow")?.withRenderingMode(.alwaysOriginal)
        user_image.image = image
        user_image.contentMode = .scaleToFill
        user_image.heightAnchor.constraint(equalToConstant: 140).isActive = true
        user_image.widthAnchor.constraint(equalToConstant: 200).isActive = true
        user_image.translatesAutoresizingMaskIntoConstraints = false
        return user_image
    }()
    let contactName:UILabel = {
        let name = UILabel()
        name.text = "Unknown"
        name.textAlignment = .center
        name.adjustsFontForContentSizeCategory = true
        name.translatesAutoresizingMaskIntoConstraints = false
        //name.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return name
    }()
    let mobileNumber:UILabel = {
        let number = UILabel()
        number.text = "+919304712071"
        number.textAlignment = .center
        number.adjustsFontForContentSizeCategory = true
        number.translatesAutoresizingMaskIntoConstraints = false
        //number.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return number
    }()
    let callTime:UILabel = {
        let callTimimg = UILabel()
        callTimimg.text = "00:00:00"
        callTimimg.textAlignment = .center
        callTimimg.adjustsFontForContentSizeCategory = true
        callTimimg.translatesAutoresizingMaskIntoConstraints = false
       // callTimimg.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return callTimimg
    }()
    
   //MARK: - Mute Button
    let muteWholeView:UIView = {
        let muteView = UIView()
        muteView.backgroundColor = EIColor.init(hexString: "#797979")
        muteView.translatesAutoresizingMaskIntoConstraints = false
        muteView.layer.cornerRadius = 47.5
        muteView.layer.masksToBounds = true
        return muteView
    }()
    let muteImage:UIImageView = {
        let mute_image = UIImageView()
        let image = Constant.getImage(named: "mute")?.withRenderingMode(.alwaysOriginal)
        mute_image.image = image
        mute_image.contentMode = .scaleToFill
        mute_image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        mute_image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        mute_image.translatesAutoresizingMaskIntoConstraints = false
        return mute_image
    }()
    let muteLbl:UILabel = {
        let mute_label = UILabel()
        mute_label.text = "Mute"
        mute_label.textAlignment = .center
        mute_label.adjustsFontForContentSizeCategory = true
        mute_label.translatesAutoresizingMaskIntoConstraints = false
        return mute_label
    }()
    let muteButton: UIButton = {
        let Btn = UIButton(type: .system)
        Btn.backgroundColor = .clear
        Btn.frame = CGRect(x: 0, y: 0, width: 89, height: 120)
        return Btn
    }()
    
    //MARK: - KeyBoard Button
    let keyboardWholeView:UIView = {
        let keyboardView = UIView()
        keyboardView.backgroundColor = EIColor.init(hexString: "#797979")
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        keyboardView.layer.cornerRadius = 47.5
        keyboardView.layer.masksToBounds = true
        return keyboardView
    }()
    let keyboardImage:UIImageView = {
        let keyboard_image = UIImageView()
        let image = Constant.getImage(named: "keypad")?.withRenderingMode(.alwaysOriginal)
        keyboard_image.image = image
        keyboard_image.contentMode = .scaleToFill
        keyboard_image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        keyboard_image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        keyboard_image.translatesAutoresizingMaskIntoConstraints = false
        return keyboard_image
    }()
    let keyboardLbl:UILabel = {
        let keyboard_label = UILabel()
        keyboard_label.text = "Keyboard"
        keyboard_label.textAlignment = .center
        keyboard_label.adjustsFontForContentSizeCategory = true
        keyboard_label.translatesAutoresizingMaskIntoConstraints = false
        return keyboard_label
    }()
    
    let keyboardButton: UIButton = {
        let Btn = UIButton(type: .system)
        Btn.backgroundColor = .clear
        Btn.frame = CGRect(x: 0, y: 0, width: 89, height: 120)
        return Btn
    }()
    //MARK: - Audio Button
    
    let audioWholeView:UIView = {
        let audioView = UIView()
        audioView.backgroundColor = EIColor.init(hexString: "#797979")
        audioView.translatesAutoresizingMaskIntoConstraints = false
        audioView.layer.cornerRadius = 47.5
        audioView.layer.masksToBounds = true
        return audioView
    }()
    let audioImage:UIImageView = {
        let audio_image = UIImageView()
        let image = Constant.getImage(named: "audio")?.withRenderingMode(.alwaysOriginal)
        audio_image.image = image
        audio_image.contentMode = .scaleToFill
        audio_image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        audio_image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        audio_image.translatesAutoresizingMaskIntoConstraints = false
        return audio_image
    }()
    let audioLbl:UILabel = {
        let audio_label = UILabel()
        audio_label.text = "Audio"
        audio_label.textAlignment = .center
        audio_label.adjustsFontForContentSizeCategory = true
        audio_label.translatesAutoresizingMaskIntoConstraints = false
        return audio_label
    }()
    
    let audioButton: UIButton = {
        let Btn = UIButton(type: .system)
        Btn.backgroundColor = .clear
        Btn.frame = CGRect(x: 0, y: 0, width: 89, height: 120)
        return Btn
    }()
    //MARK: - Call Cancel Button
    let callCancelView:UIView = {
        let callCancelView = UIView()
        callCancelView.backgroundColor = .red
        callCancelView.translatesAutoresizingMaskIntoConstraints = false
        callCancelView.layer.cornerRadius = 50
        callCancelView.layer.masksToBounds = true
        return callCancelView
    }()
    
    let callCancelImage:UIImageView = {
        let callCancel_image = UIImageView()
        let image = Constant.getImage(named: "hangUp")?.withRenderingMode(.alwaysOriginal)
        callCancel_image.image = image
        callCancel_image.contentMode = .scaleToFill
        callCancel_image.heightAnchor.constraint(equalToConstant: 40).isActive = true
        callCancel_image.widthAnchor.constraint(equalToConstant: 40).isActive = true
        callCancel_image.translatesAutoresizingMaskIntoConstraints = false
        return callCancel_image
    }()
    let callCancelButton: UIButton = {
        let Btn = UIButton(type: .system)
        Btn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return Btn
    }()
    
    // MARK: - Private properties
    private var userDetailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK: - Private properties
    private var muteBtnStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    private var keyBoardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    private var audioStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    // MARK: - Private properties
    private var callEventStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 25
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    
    
    
    private func setupViews(){
        view.backgroundColor = .white
        view.addSubview(userImage)
        userImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.addSubview(userDetailsStackView)
        userDetailsStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 220).isActive = true
        userDetailsStackView.centerXAnchor.constraint(equalTo: userImage.centerXAnchor).isActive = true
        userDetailsStackView.addArrangedSubview(contactName)
        userDetailsStackView.addArrangedSubview(mobileNumber)
        userDetailsStackView.addArrangedSubview(callTime)
        contactName.font = UIFont.boldSystemFont(ofSize: 25.0)
        mobileNumber.font = UIFont.boldSystemFont(ofSize: 22.0)
        callTime.font = UIFont.systemFont(ofSize: 18.0)
        
        
        view.addSubview(callEventStackView)
        callEventStackView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        callEventStackView.widthAnchor.constraint(equalToConstant: 340).isActive = true
        callEventStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        callEventStackView.centerXAnchor.constraint(equalTo: userImage.centerXAnchor).isActive = true
        callEventStackView.addArrangedSubview(muteBtnStackView)
        muteBtnStackView.addArrangedSubview(muteWholeView)
        //muteWholeView.addSubview(muteView)
        //muteView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        muteWholeView.addSubview(muteImage)
        muteImage.centerXAnchor.constraint(equalTo: muteWholeView.centerXAnchor).isActive = true
        muteImage.centerYAnchor.constraint(equalTo: muteWholeView.centerYAnchor).isActive = true
        muteBtnStackView.addArrangedSubview(muteLbl)
        muteLbl.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        
       // muteWholeView.backgroundColor = .gray
        //muteView.backgroundColor = .red
        callEventStackView.addArrangedSubview(keyBoardStackView)
        keyBoardStackView.addArrangedSubview(keyboardWholeView)
        //muteWholeView.addSubview(muteView)
        //muteView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        keyboardWholeView.addSubview(keyboardImage)
        keyboardImage.centerXAnchor.constraint(equalTo: keyboardWholeView.centerXAnchor).isActive = true
        keyboardImage.centerYAnchor.constraint(equalTo: keyboardWholeView.centerYAnchor).isActive = true
        keyBoardStackView.addArrangedSubview(keyboardLbl)
        keyboardLbl.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        callEventStackView.addArrangedSubview(audioStackView)
        audioStackView.addArrangedSubview(audioWholeView)
        //muteWholeView.addSubview(muteView)
        //muteView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        audioWholeView.addSubview(audioImage)
        audioImage.centerXAnchor.constraint(equalTo: audioWholeView.centerXAnchor).isActive = true
        audioImage.centerYAnchor.constraint(equalTo: audioWholeView.centerYAnchor).isActive = true
        audioStackView.addArrangedSubview(audioLbl)
        audioLbl.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        view.addSubview(callCancelView)
        callCancelView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        callCancelView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        callCancelView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        callCancelView.centerXAnchor.constraint(equalTo: userImage.centerXAnchor).isActive = true
        callCancelView.addSubview(callCancelImage)
        callCancelImage.centerXAnchor.constraint(equalTo: callCancelView.centerXAnchor).isActive = true
        callCancelImage.centerYAnchor.constraint(equalTo: callCancelView.centerYAnchor).isActive = true
        
        muteWholeView.addSubview(muteButton)
        keyboardWholeView.addSubview(keyboardButton)
        audioWholeView.addSubview(audioButton)
        callCancelView.addSubview(callCancelButton)
        
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
    }
    open override func viewDidLoad() {
        super.viewDidLoad()
        print("CallViewController")
        
        
        muteButton.addTarget(self, action: #selector(actionOnMuteBtn), for: .touchUpInside)
        keyboardButton.addTarget(self, action: #selector(actionOnKeyboardBtn), for: .touchUpInside)
        audioButton.addTarget(self, action: #selector(actionOnAudioBtn), for: .touchUpInside)
        callCancelButton.addTarget(self, action: #selector(actionOnhungUpBtn), for: .touchUpInside)
    }
    
    @objc private func actionOnMuteBtn(){
        print("actionOnMuteBtn")
    }
    
    @objc private func actionOnKeyboardBtn(){
        print("actionOnKeyboardBtn")
    }
    @objc private func actionOnAudioBtn(){
        print("actionOnAudioBtn")
        
    }
    
    @objc private func actionOnhungUpBtn(){
            dismiss(animated: true)
        print("actionOnhungUpBtn")
        }
    }
    

