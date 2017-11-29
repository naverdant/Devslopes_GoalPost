//
//  UIViewExt.swift
//  GoalPost
//
//  Created by Perfect on 2017/11/29.
//  Copyright © 2017年 Alex. All rights reserved.
//

import UIKit

extension UIView {
    
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeViewFrame(_ :)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    func changeViewFrame(_ notification: NSNotification) {
        let startFrame = notification.userInfo? [UIKeyboardFrameBeginUserInfoKey] as? CGRect
        let endFrame = notification.userInfo? [UIKeyboardFrameEndUserInfoKey] as? CGRect
        let duration = notification.userInfo? [UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval
        let curve = notification.userInfo? [UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
        
        let deltaY = (endFrame?.origin.y)! - (startFrame?.origin.y)!
        
        UIView.animate(withDuration: duration!, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(curve!)), animations: { 
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
}
