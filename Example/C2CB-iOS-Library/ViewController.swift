//
//  ViewController.swift
//  C2CB-iOS-Library
//
//  Created by Satyam Kumar on 12/01/2023.
//  Copyright (c) 2023 Satyam Kumar. All rights reserved.
//

import UIKit
import C2CB_iOS_Library
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main.bundleIdentifier
        print("bundle___________",bundle ?? "")
       // self.DoneKeyboard(dismissOnTap: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension ViewController{
    @IBAction func actionOnSmsBtn(_ sender:UIButton){
        print("actionOnSmsBtn")
//        SmsHandleView.onPresent(on: self){_ in
//            print("actionOnSmsBtn 22")
//        }
    }
    
    @IBAction func actionOnCallBtn(_ sender:UIButton){
        print("actionOnCallBtn")
//        CallHandleView.onNaviagtionCallView(on: self){_ in
//            print("actionOnCallBtn 11")
//        }
    }
    @IBAction func actionOnEmailBtn(_ sender:UIButton){
        print("actionOnEmailBtn")
//        SmsValidationModel.onPresent(on: self){_ in
//            print("actionOnCallBtn 11")
//        }
    }
}
