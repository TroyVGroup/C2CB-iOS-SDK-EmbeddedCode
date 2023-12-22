//
//  CallHandleView.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 06/12/23.
//

import Foundation
open class CallHandleView:CallViewController{

    open class func onNaviagtionCallView(
        on viewController:UIViewController,
        configuration: (CallViewController) -> Void = {_ in }){
        let controller = CallViewController()
        configuration(controller)
        let navigationController = UINavigationController(rootViewController: controller)
            navigationController.modalPresentationStyle = .fullScreen
           // viewController.navigationController?.pushViewController(navigationController, animated: true)
            viewController.present(navigationController, animated: true, completion: nil)
    }

}
