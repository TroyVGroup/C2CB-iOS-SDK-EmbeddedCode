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
        let image = Constant.getImage(named: "phone-call")?.withRenderingMode(.alwaysOriginal)
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
        let image = Constant.getImage(named: "messenger")?.withRenderingMode(.alwaysOriginal)
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
        let image = Constant.getImage(named: "envelope")?.withRenderingMode(.alwaysOriginal)
        self.setBackgroundImage(image, for: .normal)
        self.contentMode = .scaleAspectFit
    }
}
