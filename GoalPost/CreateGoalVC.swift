//
//  CreateGoalVC.swift
//  GoalPost
//
//  Created by Perfect on 2017/11/29.
//  Copyright © 2017年 Alex. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextStepBtn: UIButton!
    @IBOutlet weak var goalDescriptionTextView: UITextView!
    var goalType : GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalDescriptionTextView.delegate = self
        nextStepBtn.bindToKeyboard()
    }

    @IBAction func shortTermBtnWasPressed(_ sender: UIButton) {
        goalType = .shortTerm
        shortTermBtn.selectedBackgroundColor()
        longTermBtn.deselectedBackgroundColor()
    }
    
    @IBAction func longTermBtnWasPressed(_ sender: UIButton) {
        goalType = .longTerm
        shortTermBtn.deselectedBackgroundColor()
        longTermBtn.selectedBackgroundColor()
    }
    
    @IBAction func backBtnWasPressed(_ sender: UIButton) {
        dismissDetailViewController()
    }
    
    @IBAction func nextStepBtnWasPressed(_ sender: UIButton) {
        if goalDescriptionTextView.text != "What is your goal?" && goalDescriptionTextView.text != "" {
            guard let goalProgressVC = storyboard?.instantiateViewController(withIdentifier: "goalProgressVC") as? GoalProgressVC  else { return }
            goalProgressVC.initData(withDescription: goalDescriptionTextView.text, andGoalType: goalType)
            presentingViewController?.presentSecondaryDetailViewController(goalProgressVC)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if goalDescriptionTextView.text == "What is your goal?" {
            goalDescriptionTextView.text = ""
        }
    }
}
