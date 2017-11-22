//
//  GoalsVC.swift
//  GoalPost
//
//  Created by Perfect on 2017/11/14.
//  Copyright © 2017年 Alex. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var goals :[Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.isHidden = false
    }

    @IBAction func addGoalBtmWasPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "createGoalVC") as? CreateGoalVC else {
            return
        }
        presentDetailViewController(createGoalVC)
    }
}


extension GoalsVC:  UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Alex: Use "guard let" to protect. Use "as?" to cast. Else return a blank tableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCellTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCellDescription(description: "Eat salad twice a week", type: .shortTerm, progressAmount: 2)
        return cell
    }
}

extension GoalsVC {
    
}






