//
//  AnimatedViewController.swift
//  walrus-test
//
//  Created by Chaitanya Deshpande on 02/09/21.
//

import UIKit

class AnimatedViewController: UIViewController {
    
    let layer = CALayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        layer.backgroundColor = UIColor.systemOrange.cgColor
        layer.frame = CGRect(x: view.bounds.minX + 30 , y: view.bounds.midY, width: 60, height: 60)
        layer.cornerRadius = 12
        view.layer.addSublayer(layer)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.animateAll()
        }
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.someAction(sender:)))
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc func someAction(sender:UITapGestureRecognizer){
    
    }

    
    func animateAll() {
        let animate = CABasicAnimation(keyPath: "position")
        animate.fromValue = CGPoint(x: layer.position.x, y: layer.position.y)
        animate.toValue = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        animate.duration = 1
        animate.isRemovedOnCompletion = false
        animate.fillMode = .forwards
        animate.beginTime = CACurrentMediaTime()
        layer.add(animate, forKey: nil)
        
        let scaleAnimate = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimate.fromValue = 1
        scaleAnimate.toValue = 2
        scaleAnimate.duration = 1
        scaleAnimate.isRemovedOnCompletion = false
        scaleAnimate.fillMode = .forwards
        scaleAnimate.beginTime = CACurrentMediaTime()
        layer.add(scaleAnimate, forKey: nil)
        
        let colorAnimate = CABasicAnimation(keyPath: "backgroundColor")
        colorAnimate.fromValue = UIColor.systemOrange.cgColor
        colorAnimate.toValue = UIColor.init(hexaString: "#3A8D8F").cgColor
        colorAnimate.duration = 1
        colorAnimate.isRemovedOnCompletion = false
        colorAnimate.fillMode = .forwards
        scaleAnimate.beginTime = CACurrentMediaTime()
        layer.add(colorAnimate, forKey: nil)
    }
    
    
}
