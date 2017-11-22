//
//  CreateGoalVC.swift
//  GoalPost
//
//  Created by Perfect on 2017/11/14.
//  Copyright © 2017年 Alex. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType : GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goalTextView.delegate = self
        self.nextBtn.bindToKeyboard()
    }
    
    @IBAction func shortTermBtnWasPressed(_ sender: UIButton) {
        self.shortTermBtn.selectedBackgroundColor()
        self.longTermBtn.deselectedBackgroundColor()
        self.goalType = .shortTerm
    }
    
    @IBAction func longTermBtnWasPressed(_ sender: UIButton) {
        self.longTermBtn.selectedBackgroundColor()
        self.shortTermBtn.deselectedBackgroundColor()
        self.goalType = .longTerm
    }
    
    @IBAction func nextBtnWasPressed(_ sender: UIButton) {
        if(self.goalTextView.text != nil && self.goalTextView.text != "What is your goal?") {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "finishGoalVC") as? FinishGoalVC else { return }
            finishGoalVC.goalType = self.goalType
            finishGoalVC.goalDescription = self.goalTextView.text
            presentDetailViewController(finishGoalVC)
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: UIButton) {
        dismissDetailViewController()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
