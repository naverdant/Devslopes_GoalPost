//
//  UIViewControllerExt.swift
//  GoalPost
//
//  Created by Perfect on 2017/11/29.
//  Copyright © 2017年 Alex. All rights reserved.
//


import UIKit
//import Foundation

extension UIViewController {
    
    func presentDetailViewController(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        transition.duration = 0.3
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func presentSecondaryDetailViewController(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        transition.duration = 0.3
        
        presentedViewController?.dismiss(animated: false, completion: {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        })
//        guard let presentedViewController = presentedViewController else { return }
//
//        presentedViewController.dismiss(animated: false) {
//            self.view.window?.layer.add(transition, forKey: kCATransition)
//            self.present(viewControllerToPresent, animated: false, completion: nil)
//        }
    }
    
    func dismissDetailViewController() {
        let transition = CATransition()
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromTop
        transition.duration = 0.3
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
}
