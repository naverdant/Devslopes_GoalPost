//
//  UIViewExt.swift
//  GoalPost
//
//  Created by Perfect on 2017/11/20.
//  Copyright © 2017年 Alex. All rights reserved.
//

import UIKit

extension UIView {
    
    func bindToKeyboard() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardFrameChanged(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    
    @objc func keyboardFrameChanged(_ notification: NSNotification) {
        let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        let curve = notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let startFrame = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? CGRect
        let endFrame = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect
        let deltaY = (endFrame?.origin.y)! - (startFrame?.origin.y)!
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
}
