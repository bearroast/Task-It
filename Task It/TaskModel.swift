//
//  TaskModel.swift
//  Task It
//
//  Created by Bjørn Rostad on 3/28/15.
//  Copyright (c) 2015 Bjørn Rostad. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)

class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subtask: String
    @NSManaged var task: String

}
