//
//  Alerts.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 06/12/23.
//

import Foundation
//public class Alerts{
    //MARK:- UIAlerts
       public func showAlert(title: String, message: String,view: UIViewController) -> Void {
           
           let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
           //let topVC = topMostController()
           let OKAction = UIAlertAction(title: "OK", style: .default) {
               (action: UIAlertAction) in print("ok pressed")
           }
           alertController.addAction(OKAction)
           if Constant.IS_IPAD{
           if let popup = alertController.popoverPresentationController {
               popup.sourceView = view.view
                             popup.sourceRect = CGRect(x: view.view.frame.size.width / 2, y: view.view.frame.size.height / 4, width: 0, height: 0)
               }
            }
           DispatchQueue.main.async {
               view.present(alertController, animated: true, completion: nil)
           }
       }

       public func showAlertWithOkAction(title: String, message: String,view: UIViewController,actionHandler:@escaping alertActionHandler) -> Void {
       
       let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
       let OKAction = UIAlertAction(title: "OK", style: .default) {
           (action: UIAlertAction) in
           actionHandler()
       }
       alertController.addAction(OKAction)
           if Constant.IS_IPAD{
                  if let popup = alertController.popoverPresentationController {
                      popup.sourceView = view.view
                                    popup.sourceRect = CGRect(x: view.view.frame.size.width / 2, y: view.view.frame.size.height / 4, width: 0, height: 0)
                  }
     }
           DispatchQueue.main.async {
               view.present(alertController, animated: true, completion: nil)
           }
   }
//}
