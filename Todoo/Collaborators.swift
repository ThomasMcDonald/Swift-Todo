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
class Collaborators{
    var name: String;
    var role: String;
    
    
    init?(name:String, role:String) {
        
        
        // The taskName variable must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        self.name = name;
        self.role = role;
    }

    
}
