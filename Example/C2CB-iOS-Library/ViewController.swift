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

    
    @IBOutlet weak var mycustomeView:C2CSdkCustomView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mycustomeView.channel_id = "678e4707e3da2cfe5e677430"
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
