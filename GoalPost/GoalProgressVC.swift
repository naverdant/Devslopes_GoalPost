//
//  GoalProgressVC.swift
//  GoalPost
//
//  Created by Perfect on 2017/11/29.
//  Copyright © 2017年 Alex. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalProgressVC: UIViewController {

    @IBOutlet weak var progressTextfield: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!
    
    private var goalDescription: String?
    private var goalType: GoalType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
    }

    func initData(withDescription goalDescription: String, andGoalType goalType: GoalType) {
        self.goalDescription = goalDescription
        self.goalType = goalType
    }
    
    @IBAction func backBtnWasPressed() {
        dismissDetailViewController()
    }
    
    @IBAction func createBtnWasPressed(_ sender: UIButton) {
        if progressTextfield.text != nil && progressTextfield.text != "0" {
            save(completionHandler: { (finished) in
                if finished == true {
                    print("Goal saved.")
                    dismissDetailViewController()
                }else { print("Goal save error.") }
            })
        }
    }
    
    func save(completionHandler:(_ finished: Bool) -> ()) {
        if progressTextfield.text == "0" { return }
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let obj = Goal(context: managedContext)
        obj.goalDescription = goalDescription
        obj.goalType = goalType?.rawValue
        obj.goalProgressValue = Int32(progressTextfield.text!)!
        
        do {
            try managedContext.save()
            completionHandler(true)
        } catch  {
            print(error.localizedDescription)
            completionHandler(false)
        }
    }
}
