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
        SmsHandleView.onPresent(on: self){_ in
            print("actionOnSmsBtn 22")
        }
    }
}
