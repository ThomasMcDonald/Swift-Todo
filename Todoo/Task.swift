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
struct historyStruct {
    let date: String
    let comment: String
}

class Task{
    var taskName: String;
    var history = [historyStruct]();
    var data:Array<Any>
    
    
    
    
    
    init?(taskName:String, history:[historyStruct]) {
        
        
        // The taskName variable must not be empty
        guard !taskName.isEmpty else {
            return nil
        }
        
        self.taskName = taskName;
        self.history = history;
        self.data = [self.history];
    }
    
    
    /**
     Returns the Task Name, with type of string
     */
    func getTaskName() -> String {
        return self.taskName;
    }
    
    
}
