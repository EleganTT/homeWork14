//
//  Tasks+CoreDataClass.swift
//  
//
//  Created by Dmitriy Lee on 03.03.2021.
//
//

import Foundation
import CoreData


@objc(Tasks)
public class Tasks: NSManagedObject {
    class func newTask(description: String) -> Tasks {
        let task = Tasks(context: CoreDataManager.shared.managedObjectContext)
        
        task.taskDescription = description
        
        return task
    }
}

