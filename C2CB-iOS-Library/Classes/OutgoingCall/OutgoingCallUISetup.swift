//
//  OutgoingCallUISetup.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 22/12/23.
//

import UIKit
import AVFoundation
import TwilioVoice
open class OutgoingCallUISetup:UIViewController{
    
    let containerView:UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 15
        return containerView
    }()
    
    let callTime:UILabel = {
        let callTimimg = UILabel()
        callTimimg.text = "00:00:00"
        callTimimg.textColor = .white
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
        muteView.layer.cornerRadius = 40
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
//    let muteLbl:UILabel = {
//        let mute_label = UILabel()
//        mute_label.text = "Mute"
//        mute_label.textAlignment = .center
//        mute_label.adjustsFontForContentSizeCategory = true
//        mute_label.translatesAutoresizingMaskIntoConstraints = false
//        return mute_label
//    }()
    let muteButton: UIButton = {
        let Btn = UIButton(type: .system)
        Btn.backgroundColor = .clear
        Btn.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        return Btn
    }()
    
    //MARK: - KeyBoard Button
    let keyboardWholeView:UIView = {
        let keyboardView = UIView()
        keyboardView.backgroundColor = EIColor.init(hexString: "#797979")
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        keyboardView.layer.cornerRadius = 40
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
//    let keyboardLbl:UILabel = {
//        let keyboard_label = UILabel()
//        keyboard_label.text = "Keyboard"
//        keyboard_label.textAlignment = .center
//        keyboard_label.adjustsFontForContentSizeCategory = true
//        keyboard_label.translatesAutoresizingMaskIntoConstraints = false
//        return keyboard_label
//    }()
    
    let keyboardButton: UIButton = {
        let Btn = UIButton(type: .system)
        Btn.backgroundColor = .clear
        Btn.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        return Btn
    }()
    //MARK: - Audio Button
    
    let audioWholeView:UIView = {
        let audioView = UIView()
        audioView.backgroundColor = EIColor.init(hexString: "#797979")
        audioView.translatesAutoresizingMaskIntoConstraints = false
        audioView.layer.cornerRadius = 40
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
//    let audioLbl:UILabel = {
//        let audio_label = UILabel()
//        audio_label.text = "Audio"
//        audio_label.textAlignment = .center
//        audio_label.adjustsFontForContentSizeCategory = true
//        audio_label.translatesAutoresizingMaskIntoConstraints = false
//        return audio_label
//    }()
    
    let audioButton: UIButton = {
        let Btn = UIButton(type: .system)
        Btn.backgroundColor = .clear
        Btn.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        return Btn
    }()
    //MARK: - Call Cancel Button
    let callCancelView:UIView = {
        let callCancelView = UIView()
        callCancelView.backgroundColor = .red
        callCancelView.translatesAutoresizingMaskIntoConstraints = false
        callCancelView.layer.cornerRadius = 40
        callCancelView.layer.masksToBounds = true
        return callCancelView
    }()
    
    let callCancelImage:UIImageView = {
        let callCancel_image = UIImageView()
        let image = Constant.getImage(named: "hangUp")?.withRenderingMode(.alwaysOriginal)
        callCancel_image.image = image
        callCancel_image.contentMode = .scaleToFill
        callCancel_image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        callCancel_image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        callCancel_image.translatesAutoresizingMaskIntoConstraints = false
        return callCancel_image
    }()
    let callCancelButton: UIButton = {
        let Btn = UIButton(type: .system)
        Btn.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
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
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    
    //MARK: - Keyboard Design
    let keyboardContainerView:UIView = {
        let keyboardView = UIView()
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        keyboardView.isHidden = true
        return keyboardView
    }()
  
    let hideKeyboardButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Hide", for: .normal)
        return btn
    }()
    
    let dailpadtxt:UITextField = {
        let text = UITextField()
        text.textAlignment = .center
        text.textColor = .black
        text.borderStyle = .none
        text.translatesAutoresizingMaskIntoConstraints = false
        text.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return text
    }()
    let removeTextBtn: UIButton = {
        let removeTextBtn = UIButton(type: .system)
        //delete.left.fill
        if #available(iOS 13.0, *) {
            removeTextBtn.setImage(UIImage(systemName: "delete.left.fill"), for: .normal)
        } else {
            let image = Constant.getImage(named: "cancel")?.withRenderingMode(.alwaysOriginal)
            removeTextBtn.setImage(image, for: .normal)
        }
        removeTextBtn.tintColor = .gray
        removeTextBtn.contentMode = .scaleAspectFit
        return removeTextBtn
    }()
    let dailTextStack:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        return stackView
    }()
    let oneBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.tag = 1
        btn.setTitle("1", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let twoBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.tag = 2
        btn.setTitle("2", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let threeBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.tag = 3
        btn.setTitle("3", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let rowOneStack:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    //row 2
    let fourBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.tag = 4
        btn.setTitle("4", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let fiveBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.tag = 5
        btn.setTitle("5", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let sixBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.tag = 6
        btn.setTitle("6", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let rowTwoStack:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    //row 3
    let sevenBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.tag = 7
        btn.setTitle("7", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let eightBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.tag = 8
        btn.setTitle("8", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let nineBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.tag = 9
        btn.setTitle("9", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let rowThreeStack:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    //row 4
    let starBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.tag = 11
        btn.setTitle("*", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let zeroBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.tag = 0
        btn.setTitle("0", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let hetacBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.tag = 12
        btn.setTitle("#", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let rowFourStack:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    
    let coloumStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    
    
    
    var timer : Timer?
    var counter = 0
    var callSetupModel = OutgoingCallModelView()
    private let notificationCenter = NotificationCenter.default
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval:1, target:self, selector:#selector(callTimer), userInfo: nil, repeats: true)
        muteButton.addTarget(self, action: #selector(actionOnMuteBtn), for: .touchUpInside)
        keyboardButton.addTarget(self, action: #selector(actionOnKeyboardBtn), for: .touchUpInside)
        audioButton.addTarget(self, action: #selector(actionOnAudioBtn), for: .touchUpInside)
        callCancelButton.addTarget(self, action: #selector(actionOnhungUpBtn), for: .touchUpInside)
        
        //keyboard
        hideKeyboardButton.addTarget(self, action: #selector(actionOnHideKeyboardBtn), for: .touchUpInside)
        removeTextBtn.addTarget(self, action: #selector(actionOnRemoveTextBtn), for: .touchUpInside)
        
        oneBtn.addTarget(self, action: #selector(appendAllNumberIntextFieldBtn), for: .touchUpInside)
        twoBtn.addTarget(self, action: #selector(appendAllNumberIntextFieldBtn), for: .touchUpInside)
        threeBtn.addTarget(self, action: #selector(appendAllNumberIntextFieldBtn), for: .touchUpInside)
        fourBtn.addTarget(self, action: #selector(appendAllNumberIntextFieldBtn), for: .touchUpInside)
        fiveBtn.addTarget(self, action: #selector(appendAllNumberIntextFieldBtn), for: .touchUpInside)
        sixBtn.addTarget(self, action: #selector(appendAllNumberIntextFieldBtn), for: .touchUpInside)
        sevenBtn.addTarget(self, action: #selector(appendAllNumberIntextFieldBtn), for: .touchUpInside)
        eightBtn.addTarget(self, action: #selector(appendAllNumberIntextFieldBtn), for: .touchUpInside)
        nineBtn.addTarget(self, action: #selector(appendAllNumberIntextFieldBtn), for: .touchUpInside)
        starBtn.addTarget(self, action: #selector(appendAllNumberIntextFieldBtn), for: .touchUpInside)
        zeroBtn.addTarget(self, action: #selector(appendAllNumberIntextFieldBtn), for: .touchUpInside)
        hetacBtn.addTarget(self, action: #selector(appendAllNumberIntextFieldBtn), for: .touchUpInside)
        
        
        callSetupModel.outgoingView = self
        CallHandler.shared.callkit()
        callSetupModel.startcalling()
        notificationCenter.addObserver(self,selector:#selector(call_disconnect(_:)),name: NSNotification.Name ("call_disconnect"),object: nil)
    }
    deinit {
        notificationCenter.removeObserver(self, name:NSNotification.Name ("call_disconnect"), object: nil)
    }
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
    }
    
    private func setupViews(){
       
       
        view.addSubview(containerView)
        containerView.backgroundColor = .gray
        containerView.addSubview(callTime)
        containerView.addSubview(callEventStackView)
        callEventStackView.addArrangedSubview(muteBtnStackView)
        muteBtnStackView.addArrangedSubview(muteWholeView)
        muteWholeView.addSubview(muteImage)
        callEventStackView.addArrangedSubview(keyBoardStackView)
        keyBoardStackView.addArrangedSubview(keyboardWholeView)
        keyboardWholeView.addSubview(keyboardImage)
        callEventStackView.addArrangedSubview(audioStackView)
        audioStackView.addArrangedSubview(audioWholeView)
        audioWholeView.addSubview(audioImage)
        view.addSubview(callCancelView)
        callCancelView.addSubview(callCancelImage)
        muteWholeView.addSubview(muteButton)
        keyboardWholeView.addSubview(keyboardButton)
        audioWholeView.addSubview(audioButton)
        callCancelView.addSubview(callCancelButton)
        
        NSLayoutConstraint.activate([
            //container
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            containerView.heightAnchor.constraint(equalToConstant: 320),
            //callTime
            callTime.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            callTime.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40),
            //call Event stack view
            callEventStackView.heightAnchor.constraint(equalToConstant: 80),
            callEventStackView.widthAnchor.constraint(equalToConstant: 280),
            callEventStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            callEventStackView.topAnchor.constraint(equalTo: callTime.topAnchor, constant: 80),
            //mute image
            muteImage.centerXAnchor.constraint(equalTo: muteWholeView.centerXAnchor),
            muteImage.centerYAnchor.constraint(equalTo: muteWholeView.centerYAnchor),
            //key board image
            keyboardImage.centerXAnchor.constraint(equalTo: keyboardWholeView.centerXAnchor),
            keyboardImage.centerYAnchor.constraint(equalTo: keyboardWholeView.centerYAnchor),
            //audio image
            audioImage.centerXAnchor.constraint(equalTo: audioWholeView.centerXAnchor),
            audioImage.centerYAnchor.constraint(equalTo: audioWholeView.centerYAnchor),
            //cancel view
            callCancelView.heightAnchor.constraint(equalToConstant: 80),
            callCancelView.widthAnchor.constraint(equalToConstant: 80),
            callCancelView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            callCancelView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            //cancel image
            callCancelImage.centerXAnchor.constraint(equalTo: callCancelView.centerXAnchor),
            callCancelImage.centerYAnchor.constraint(equalTo: callCancelView.centerYAnchor)
            
            ])
        setUpFontSizeInCallBackForm()
        keyboardSetUpStyle()
        
    }
    
    
    
    private func keyboardSetUpStyle(){
        view.addSubview(keyboardContainerView)
        keyboardContainerView.backgroundColor = .white
        keyboardContainerView.addSubview(hideKeyboardButton)
        print("keyboardContainerViewWidth",keyboardContainerView.bounds.size.width)
        
        hideKeyboardButton.frame = CGRect(x: keyboardContainerView.bounds.size.width-80, y: 10, width: 80, height: 40)
        dailTextStack.addArrangedSubview(dailpadtxt)
        dailTextStack.addArrangedSubview(removeTextBtn)
        removeTextBtn.frame = CGRect(x: keyboardContainerView.bounds.size.width-80, y: 10, width: 30, height: 20)
        keyboardContainerView.addSubview(dailTextStack)
        
        rowOneStack.addArrangedSubview(oneBtn)
        rowOneStack.addArrangedSubview(twoBtn)
        rowOneStack.addArrangedSubview(threeBtn)

        rowTwoStack.addArrangedSubview(fourBtn)
        rowTwoStack.addArrangedSubview(fiveBtn)
        rowTwoStack.addArrangedSubview(sixBtn)

        rowThreeStack.addArrangedSubview(sevenBtn)
        rowThreeStack.addArrangedSubview(eightBtn)
        rowThreeStack.addArrangedSubview(nineBtn)

        rowFourStack.addArrangedSubview(starBtn)
        rowFourStack.addArrangedSubview(zeroBtn)
        rowFourStack.addArrangedSubview(hetacBtn)
        keyboardContainerView.addSubview(coloumStackView)
        coloumStackView.addArrangedSubview(rowOneStack)
        coloumStackView.addArrangedSubview(rowTwoStack)
        coloumStackView.addArrangedSubview(rowThreeStack)
        coloumStackView.addArrangedSubview(rowFourStack)
        NSLayoutConstraint.activate([
            
            keyboardContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardContainerView.heightAnchor.constraint(equalToConstant: 400),
            keyboardContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            dailTextStack.topAnchor.constraint(equalTo: hideKeyboardButton.topAnchor, constant: 40),
            dailTextStack.leadingAnchor.constraint(equalTo: keyboardContainerView.leadingAnchor, constant: 20),
            dailTextStack.trailingAnchor.constraint(equalTo: keyboardContainerView.trailingAnchor, constant: -20),
            dailpadtxt.widthAnchor.constraint(equalToConstant:keyboardContainerView.bounds.size.width-80),
            
            coloumStackView.leadingAnchor.constraint(equalTo: keyboardContainerView.leadingAnchor, constant: 25),
            coloumStackView.trailingAnchor.constraint(equalTo: keyboardContainerView.trailingAnchor, constant: -25),
            coloumStackView.heightAnchor.constraint(equalToConstant: 250),
           // coloumStackView.widthAnchor.constraint(equalToConstant: ),
            coloumStackView.topAnchor.constraint(equalTo: hideKeyboardButton.topAnchor, constant: 120)
            ])
    }
    
    
    
    
    func setUpFontSizeInCallBackForm(){
        callTime.font = UIFont.boldSystemFont(ofSize: 30.0)
        dailpadtxt.font = UIFont.boldSystemFont(ofSize: 30.0)
        oneBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        twoBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        threeBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        fourBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        fiveBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        sixBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        sevenBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        eightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        nineBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        starBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        zeroBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        hetacBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        
    }
    
    @objc func callTimer() {
        counter += 1
        callTime.text = callSetupModel.timeString(time: TimeInterval(counter))
    }
    
    
    func showMicrophoneAccessRequest(_ uuid: UUID, _ handle: String) {
        let alertController = UIAlertController(title: "Voice Quick Start",
                                                message: "Microphone permission not granted",
                                                preferredStyle: .alert)
        
        let continueWithoutMic = UIAlertAction(title: "Continue without microphone", style: .default) {  _ in
            //self?.performStartCallAction(uuid: uuid, handle: handle)
        }
        
        let goToSettings = UIAlertAction(title: "Settings", style: .default) { _ in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!,
                                      options: [UIApplication.OpenExternalURLOptionsKey.universalLinksOnly: false],
                                      completionHandler: nil)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { [weak self] _ in

            self?.dismiss(animated: true)
        }
        
        [continueWithoutMic, goToSettings, cancel].forEach { alertController.addAction($0) }
        
        present(alertController, animated: true, completion: nil)
    }
    @objc func call_disconnect(_ notification: Notification){
        let token_id = UserDefaults.standard.object(forKey: "call_id") as? String
        if token_id != nil{
            callSetupModel.cancelTheCall(token_id: token_id ?? "")
        }
    }
    
}
extension OutgoingCallUISetup{
    @IBAction private func actionOnMuteBtn(){
        print("actionOnMuteBtn")
        muteButton.isSelected = !muteButton.isSelected
        guard let activeCall = CallHandler.shared.activeCall else { return }
        if muteButton.isSelected {
            muteImage.image = Constant.getImage(named: "unmute")?.withRenderingMode(.alwaysOriginal)
            activeCall.isMuted = true
            muteImage.contentMode = .scaleToFill
            muteWholeView.backgroundColor = UIColor.white
            muteButton.tintColor = .clear
       }else{
           muteImage.image = Constant.getImage(named: "mute")?.withRenderingMode(.alwaysOriginal)
           activeCall.isMuted = false
           muteImage.contentMode = .scaleToFill
           muteWholeView.backgroundColor = #colorLiteral(red: 0.4745098039, green: 0.4745098039, blue: 0.4745098039, alpha: 1)
           muteButton.tintColor = .clear
       }
    }
    
    @IBAction private func actionOnKeyboardBtn(){
        print("actionOnKeyboardBtn")
        keyboardContainerView.isHidden = false
    }
    @IBAction private func actionOnAudioBtn(){
        print("actionOnAudioBtn")
        audioButton.isSelected = !audioButton.isSelected
        if audioButton.isSelected {
            audioImage.image = Constant.getImage(named: "speaker")?.withRenderingMode(.alwaysOriginal)
            audioWholeView.backgroundColor = UIColor.white
            audioButton.tintColor = .clear
            
            callSetupModel.toggleAudioRoute(toSpeaker: true)
        
       }else{
           audioImage.image = Constant.getImage(named: "audio")?.withRenderingMode(.alwaysOriginal)
           audioWholeView.backgroundColor = #colorLiteral(red: 0.4745098039, green: 0.4745098039, blue: 0.4745098039, alpha: 1)
           audioButton.tintColor = .clear
           callSetupModel.toggleAudioRoute(toSpeaker: false)
       }
        
    }
    
    @IBAction private func actionOnhungUpBtn(){
        print("actionOnhungUpBtn")
        let token_id = UserDefaults.standard.object(forKey: "call_id") as? String
        callSetupModel.cancelTheCall(token_id: token_id ?? "")
        }
    
    @IBAction private func actionOnHideKeyboardBtn(_ sender:UIButton){
        keyboardContainerView.isHidden = true
    }
    @IBAction func appendAllNumberIntextFieldBtn(_ sender:UIButton)
    {
        var digit1 = "\(sender.tag)"
        self.dailpadtxt.inputView = UIView(frame: CGRect.null)
        switch digit1 {
        case "0" :
            AudioServicesPlaySystemSound(1200)
            addLongPressGesture()
        case "1" :
            AudioServicesPlaySystemSound(1201)
        case "2" :
            AudioServicesPlaySystemSound(1202)
        case "3" :
            AudioServicesPlaySystemSound(1203)
        case "4" :
            AudioServicesPlaySystemSound(1204)
        case "5" :
            AudioServicesPlaySystemSound(1205)
        case "6" :
            AudioServicesPlaySystemSound(1206)
        case "7" :
            AudioServicesPlaySystemSound(1207)
        case "8" :
            AudioServicesPlaySystemSound(1208)
        case "9" :
            AudioServicesPlaySystemSound(1209)
        case "11" :
            AudioServicesPlaySystemSound(1210)
            digit1 = "*"
        case "12" :
            AudioServicesPlaySystemSound(1211)
            digit1 = "#"
        default:
            print("Button pressed : \(digit1)")
        }
            dailpadtxt.text = dailpadtxt.text! + digit1
        if (CallHandler.shared.activeCall != nil && CallHandler.shared.activeCall?.state == .connected) {
            print("digit1",digit1)
            CallHandler.shared.activeCall?.sendDigits(digit1)
        }
    }
    
    @objc func longPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.began {
            print("Long Press")
            dailpadtxt.text = dailpadtxt.text! + "+"
        }else{
            print("Not Long Press")
            dailpadtxt.text = dailpadtxt.text! + "0"
        }
        
    }
    @IBAction func actionOnRemoveTextBtn(_ sender:UIButton){
            dailpadtxt.text?.removeLast()
    }
    func addLongPressGesture(){
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(gesture:)))
        longPress.minimumPressDuration = 0.5
        self.zeroBtn.addGestureRecognizer(longPress)
    }
}
