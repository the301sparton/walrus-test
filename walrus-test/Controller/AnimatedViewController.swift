//
//  AnimatedViewController.swift
//  walrus-test
//
//  Created by Chaitanya Deshpande on 02/09/21.
//

import UIKit

class AnimatedViewController: UIViewController {
    var countTap : Int = 0
    let layer = CALayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        layer.backgroundColor = UIColor.systemOrange.cgColor
        layer.frame = CGRect(x: view.bounds.minX + 30 , y: view.bounds.midY, width: 60, height: 60)
        layer.cornerRadius = 12
        view.layer.addSublayer(layer)
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.someAction(sender:)))
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc func someAction(sender:UITapGestureRecognizer){
        countTap += 1
        if countTap == 1 {
            self.animateAll()
        }
        else if countTap == 2 {
            
            self.animateFinal()
        }
        else if countTap == 3 {
            self.pushViewController()
        }
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
        colorAnimate.beginTime = CACurrentMediaTime()
        layer.add(colorAnimate, forKey: nil)
    }
    
    func animateFinal(){
        
        let colorAnimate = CABasicAnimation(keyPath: "backgroundColor")
        colorAnimate.fromValue = UIColor.init(hexaString: "#3A8D8F").cgColor
        colorAnimate.toValue =  UIColor.systemGray.cgColor
        colorAnimate.duration = 1
        colorAnimate.isRemovedOnCompletion = false
        colorAnimate.fillMode = .forwards
        colorAnimate.beginTime = CACurrentMediaTime()
        layer.add(colorAnimate, forKey: nil)
        
        let scaleAnimate = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimate.fromValue = 2
        scaleAnimate.toValue = 20
        scaleAnimate.duration = 1
        scaleAnimate.isRemovedOnCompletion = false
        scaleAnimate.fillMode = .forwards
        scaleAnimate.beginTime = CACurrentMediaTime()
        layer.add(scaleAnimate, forKey: nil)
        
        let label = UILabel(frame: CGRect(x: view.bounds.minX + 30, y: view.bounds.maxY - 180, width: view.bounds.width, height: 150))
        label.text = "Tap to move\nto view\nNews List."
        label.textColor = UIColor.white
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        
        view.addSubview(label)
    }
    
    func pushViewController() {
        if let mainVC : ViewController = (Util.storyBoard.instantiateViewController(withIdentifier: "mainVC") as? ViewController) {
            self.navigationController!.pushViewController(mainVC, animated: true)
        }
    }
    
}
