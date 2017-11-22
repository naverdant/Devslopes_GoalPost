//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by Perfect on 2017/11/20.
//  Copyright © 2017年 Alex. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController {

    @IBOutlet weak var progressTextfield: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!
    
    var goalType: GoalType?
    var goalDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createGoalBtn.bindToKeyboard()
    }

    @IBAction func backBtnWasPressed(_ sender: UIButton) {
        self.dismissDetailViewController()
    }

    @IBAction func createGoalBtnWasPressed(_ sender: UIButton) {
        if (self.progressTextfield.text != "" || self.progressTextfield.text != "0") {
            
            self.save(completion: { (success) in
                if(success) {
                    print("done")
                    dismiss(animated: true, completion: nil)
                }
            })
        }
    }
    
    func save(completion:(_ finished: Bool) -> ()) {
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        do {
            try managedContext?.save()
            completion(true)
            
        } catch  {
            debugPrint("Save Fail \(error.localizedDescription)")
            print("Save Fail")
            completion(false)
        }
    }
    
}
