//
//  UIButtonExt.swift
//  GoalPost
//
//  Created by Perfect on 2017/11/20.
//  Copyright © 2017年 Alex. All rights reserved.
//

import UIKit

extension UIButton {
    func selectedBackgroundColor () {
        self.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    }
    
    func deselectedBackgroundColor () {
        self.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }
}
