//
//  GoalVC.swift
//  GoalPost
//
//  Created by Perfect on 2017/11/29.
//  Copyright © 2017年 Alex. All rights reserved.
//

import UIKit
import CoreData

class GoalVC: UIViewController {

    @IBOutlet weak var goalTable: UITableView!
    var goals = [Goal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCoreDataObjects()
        goalTable.dataSource = self
        goalTable.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        goalTable.reloadData()
    }
    
    func fetchCoreDataObjects() {
        fetchData { (success) in
            if success == true {
                if goals.count > 0 {
                    goalTable.isHidden = false
                }else {
                    goalTable.isHidden = true
                }
            }
        }
    }
    
    @IBAction func addGoalBtnPressed(_ sender: UIButton) {
        if let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "createGoalVC") as? CreateGoalVC {
            presentDetailViewController(createGoalVC)
        }
    }
}

extension GoalVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell {
            cell.updateViews(withGoal: goals[indexPath.row])
            return cell
        }else { return GoalCell() }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Kill") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        
        let addProgressAction = UITableViewRowAction(style: .normal, title: "+ 1") { (rowAction, indexPath) in
            self.addProgress(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        addProgressAction.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        
        return [deleteAction, addProgressAction]
    }
}

extension GoalVC {
    
    func addProgress(atIndexPath indexPath: IndexPath) {
        guard let managedContex = appDelegate?.persistentContainer.viewContext else { return }
        let goal = goals[indexPath.row]
        if goal.goalCompleteValue < goal.goalProgressValue {
            goal.goalCompleteValue += 1
        } else { return }
        
        do {
            try managedContex.save()
        } catch {
            debugPrint(error.localizedDescription)
            print("add fail")
        }
    }
    
    func removeGoal(atIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.delete(goals[indexPath.row])
        
        do {
            try managedContext.save()
            print("delete success")
        } catch {
            debugPrint(error.localizedDescription)
            print("delete fail")
        }
    }
    
    func fetchData(completionHandler:(_ success: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        do {
            goals = try managedContext.fetch(request) as! [Goal]
            completionHandler(true)
        } catch  {
            debugPrint("Could not fetch" + error.localizedDescription)
            completionHandler(false)
        }
    }
    
}
