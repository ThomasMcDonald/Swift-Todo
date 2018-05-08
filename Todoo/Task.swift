//
//  Task.swift
//  Todoo
//
//  Created by Thomas McDonald on 21/3/18.
//  Copyright © 2018 Thomas McDonald. All rights reserved.
//

import UIKit
/**
 This class holds the data for a singular Task
 
 - Parameters:
        taskName: the name of the task, of type string.
        dueDate: The Date/Timestamp the task was created(if applicable), of type string.
 
 - Throws: `nil` when the taskName is empty.

 */
class Task{
    var taskName: String;
    var dueDate: String;
    var taskCompleted: Bool;
    var history: [String: String] = ["date":"", "comments":""];
   
    
    
    
    
    
    init?(taskName:String, dueDate:String, taskCompleted:Bool, history:[String:String]) {
        
        
        // The taskName variable must not be empty
        guard !taskName.isEmpty else {
            return nil
        }
        
        self.taskName = taskName;
        self.dueDate = dueDate;
        self.taskCompleted = taskCompleted;
        self.history = history;
    }
    
    
    /**
     Returns the Task Name, with type of string
     */
    func getTaskName() -> String {
        return self.taskName;
    }
    
    /**
     Returns the dueDate, with type of string
     
     */
    func getdueDate() -> String {
        return self.dueDate;
    }
    
}
