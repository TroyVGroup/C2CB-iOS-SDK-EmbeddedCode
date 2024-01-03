//
//  CustomWebViewPage.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 27/12/23.
//

import Foundation
import WebKit

class CustomWebViewPage:UIViewController{
    
    let containerView:UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    let cancelButton: UIButton = {
        let cancelBtn = UIButton(type: .system)
        let image = Constant.getImage(named: "cancel")?.withRenderingMode(.alwaysOriginal)
        cancelBtn.setImage(image, for: .normal)
        cancelBtn.contentMode = .scaleAspectFit
        return cancelBtn
    }()
    
    var webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    var activityIndicator: UIActivityIndicatorView = {
        let indicator =  UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.color = .white
        return indicator
    }()
    
    var url_value:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(containerView)
        setUpUIDesign()
           // Load a URL
           if let url = URL(string: url_value ?? "") {
               let request = URLRequest(url: url)
               webView.load(request)
           }
        cancelButton.addTarget(self, action: #selector(dismissSubView), for: .touchUpInside)
        
        
       }
    
    
    func setUpUIDesign(){
        NSLayoutConstraint.activate([
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        containerView.heightAnchor.constraint(equalToConstant: 40),
        containerView.widthAnchor.constraint(equalToConstant: view.bounds.width)
        ])
        containerView.addSubview(cancelButton)
        cancelButton.frame = CGRect(x: view.bounds.size.width-40, y: 10, width: 30, height: 30)
        webView = WKWebView(frame: CGRect(x: 0, y: 40, width: view.bounds.width, height: view.bounds.height))
           webView.navigationDelegate = self  // If you need navigation delegate methods
        view.addSubview(webView)
        
        if #available(iOS 13.0, *) {
            activityIndicator = UIActivityIndicatorView(style: .large)
        } else {
            // Fallback on earlier versions
        }
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        
    }
    
    
}
extension CustomWebViewPage{
    
    @IBAction private func dismissSubView(){
        print("Call_dismissSubView")
        dismiss(animated: true)
    }
}

extension CustomWebViewPage: WKNavigationDelegate {
   
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        debugPrint("Start")
        
        activityIndicator.startAnimating()
    }
    
   
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
       debugPrint("didFinish")
        activityIndicator.stopAnimating()
   }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
       debugPrint("didFail")
        activityIndicator.stopAnimating()
   }
}
