//
//  ReadCtrl.swift
//  Tasks Switcher Trainer
//
//  Created by chistov on 15.06.2020.
//  Copyright © 2020 Sergey Chistov. All rights reserved.
//

import UIKit
import WebKit

class ReadCtrl: UIViewController, WKUIDelegate {

    // MARK: - Properties
    var webView: WKWebView!
    
    internal lazy var button_Close: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "close_cross").withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -30, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(back(_:)), for: .touchUpInside)
        return button
    }()

    public var urlString: String! {
        didSet {
            if let url = URL(string: urlString) {
                print("url req")
                let urlRequest = URLRequest(url:url)
                self.webView.load(urlRequest)
            }
        }
    }

    

    // MARK: - Functions
    // MARK: Overrides

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://bible.by/syn/45/1/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)

       
    }

    @objc func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func present(){
        let webViewVC = ReadCtrl()
        self.urlString = "yandex.ru"
        let navCon = UINavigationController(rootViewController: webViewVC)
        self.navigationController?.present(navCon, animated: true, completion: nil)
    }
}

extension ReadCtrl: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // Show here a HUD or any loader
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // Dismiss your HUD
    }
}
