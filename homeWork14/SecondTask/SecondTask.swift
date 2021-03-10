//
//  SecondTask.swift
//  homeWork14
//
//  Created by Dmitriy Lee on 01.03.2021.
//

import UIKit
import RealmSwift

//struct Tasks {
//    var taskDescription = String()
//}

class Task: Object {
    @objc dynamic var taskDescription = ""
}

class SecondTask: UIViewController {
    
    static let shared = SecondTask()
    
    private let realm = try! Realm()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tasksTextField: UITextField!
    @IBAction func addTasksButton(_ sender: Any) {
        if tasksTextField.text != "" {
            try! realm.write {
                let task = Task()
                task.taskDescription = tasksTextField.text!
                realm.add(task)
                print(realm.objects(Task.self))
            }
            tasksTextField.text = ""
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension SecondTask: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return realm.objects(Task.self).count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath) as! TasksCell
        let rows = realm.objects(Task.self)[indexPath.row]

        cell.taskLabel.text = rows.taskDescription
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            try! realm.write {
                realm.delete(realm.objects(Task.self)[indexPath.row])
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
        }
    }
}
