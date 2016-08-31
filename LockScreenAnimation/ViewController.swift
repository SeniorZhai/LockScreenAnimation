//
//  ViewController.swift
//  LockScreenAnimation
//
//  Created by zhai on 16/8/31.
//  Copyright © 2016年 zhai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var topLock: UIImageView!
    @IBOutlet var bottomLock: UIImageView!
    @IBOutlet var lockBorder: UIImageView!
    @IBOutlet var lockKeyholde: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        openLock()
    }

    func openLock(){
        UIView.animateWithDuration(0.4, delay: 5.0,options: [],animations: {
            self.lockKeyholde.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            
            },completion: {
                _ in UIView.animateWithDuration(0.5, delay: 0.2,options: [],animations: {
                    let yDelta = self.lockBorder.frame.maxY
                    self.topLock.center.y -= yDelta
                    self.lockKeyholde.center.y -= yDelta
                    self.lockBorder.center.y -= yDelta
                    self.bottomLock.center.y += yDelta
                    },completion: {_ in
                        self.topLock.removeFromSuperview()
                        self.bottomLock.removeFromSuperview()
                        self.lockBorder.removeFromSuperview()
                        self.lockKeyholde.removeFromSuperview()
                })
        })
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

