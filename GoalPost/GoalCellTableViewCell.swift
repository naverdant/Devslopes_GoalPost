//
//  GoalCellTableViewCell.swift
//  GoalPost
//
//  Created by Perfect on 2017/11/14.
//  Copyright © 2017年 Alex. All rights reserved.
//

import UIKit

class GoalCellTableViewCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!
    
    func configureCellDescription(description: String, type: GoalType, progressAmount: Int) {
        self.goalDescriptionLabel.text = description
        self.goalTypeLabel.text = type.rawValue
        self.goalProgressLabel.text = String(describing: progressAmount)
    }
}
