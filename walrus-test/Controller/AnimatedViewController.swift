//
//  AnimatedViewController.swift
//  walrus-test
//
//  Created by Chaitanya Deshpande on 02/09/21.
//

import UIKit

class AnimatedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let webViewVC : ViewController = (Util.storyBoard.instantiateViewController(withIdentifier: "mainVC") as? ViewController) {
            self.navigationController?.pushViewController(webViewVC, animated: true)
        }
        // Do any additional setup after loading the view.
    }
}
