//
//  ViewController.swift
//  animatorTest
//
//  Created by 翁培钧 on 2019/7/11.
//  Copyright © 2019 翁培钧. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animator = UIViewPropertyAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let sView = UIView(frame: CGRect(x: 20, y: 150, width: 50, height: 50))
        view.addSubview(sView)
        sView.backgroundColor = .red
        
        
        let button = UIButton(frame: CGRect(x: 10, y: 100, width: 100, height: 50))
        button.setTitle("反向动画", for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(reverse), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        
        let timing = UICubicTimingParameters(animationCurve: .easeInOut)
        
        animator = UIViewPropertyAnimator(duration: 1, timingParameters: timing)
        
        animator.addAnimations {
            sView.center = CGPoint(x: 200, y: 450)
        }
        
        animator.startAnimation()
        
    }

    @objc func reverse() {
        animator.isReversed = !animator.isReversed
    }

}
