//
//  GoalCell.swift
//  GoalPost
//
//  Created by Perfect on 2017/11/29.
//  Copyright © 2017年 Alex. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var termTypeLabel: UILabel!
    @IBOutlet weak var completeProgressValueLabel: UILabel!
    @IBOutlet weak var completedView: UIView!
    
    func updateViews(withGoal goal: Goal) {
        self.descriptionLabel.text = goal.goalDescription
        self.termTypeLabel.text = goal.goalType
        self.completeProgressValueLabel.text = String(goal.goalCompleteValue)
        if goal.goalProgressValue == goal.goalCompleteValue {
            completedView.isHidden = false
        }else {
            completedView.isHidden = true
        }
    }
}
