//
//  Tasks+CoreDataProperties.swift
//  
//
//  Created by Dmitriy Lee on 03.03.2021.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var taskDescription: String?

}
