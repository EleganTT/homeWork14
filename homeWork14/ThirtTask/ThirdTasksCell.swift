//
//  ThirdTasksCell.swift
//  homeWork14
//
//  Created by Dmitriy Lee on 03.03.2021.
//

import UIKit

class ThirdTasksCell: UITableViewCell {
    
    @IBOutlet weak var tasksLabel: UILabel!
    @IBOutlet weak var checkMarkLabel: UIButton!
    
    var taskDone = Bool()
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
       
        taskDone = !taskDone
        
        if taskDone == true {
            checkMarkLabel.tintColor = .green
            checkMarkLabel.alpha = 1
        } else {
            checkMarkLabel.tintColor = .gray
            checkMarkLabel.alpha = 0.7
        }
    }
    
    
}
