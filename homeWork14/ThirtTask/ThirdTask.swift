//
//  ThirdTask.swift
//  homeWork14
//
//  Created by Dmitriy Lee on 03.03.2021.
//

import UIKit
import CoreData

class ThirdTask: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBAction func addButtonAction(_ sender: Any) {
        if taskTextField.text != "" {
            _ = Tasks.newTask(description: taskTextField.text!)
            CoreDataManager.shared.saveContext()
            tableView.reloadData()
            taskTextField.text = ""
            print(tasks.count)
        }
    }
    
    override func viewDidLoad() {
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = UIColor.gray.cgColor
//        print(tasks.count)
    }
}


extension ThirdTask: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdTasksCell", for: indexPath) as! ThirdTasksCell
        
        let rows = tasks[indexPath.row]
        
        cell.tasksLabel?.text = rows.taskDescription
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            let task = tasks[indexPath.row]
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            CoreDataManager.shared.managedObjectContext.delete(task)
            
            CoreDataManager.shared.saveContext()
            
            tableView.endUpdates()
        }
    }
}
