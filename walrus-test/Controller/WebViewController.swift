//
//  WebViewController.swift
//  walrus-test
//
//  Created by Chaitanya Deshpande on 02/09/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var articleTitleLabel: UILabel!
    var articleTitle : String = ""
    var articleURL : String = ""
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        webView.navigationDelegate = self
        
        if let url = URL(string: articleURL) {
            webView.load(URLRequest(url: url))
        }
        articleTitleLabel.text = articleTitle
        
    }
    

    @IBAction func closeWebViewAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
