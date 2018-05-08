//
//  TodooTests.swift
//  TodooTests
//
//  Created by Thomas McDonald on 21/3/18.
//  Copyright © 2018 Thomas McDonald. All rights reserved.
//

import XCTest
@testable import Todoo

class TodooTests: XCTestCase {
    
    /**
     Confirms that the Task Data returns a Task object when passed valid parameters.
    */
    func testTaskDataModalSuccess(){
        let correctValues = Task.init(taskName: "Task 1", dueDate: "16-Apr-2018")
        XCTAssertNotNil(correctValues)
    }
    
    /**
     Confirms that the Task Data returns nil when name .
     */
    func testTaskDataModalFailure(){
        // Empty Task Name
        let emptyTaskName = Task.init(taskName: "", dueDate: "16-Apr-2018")
        XCTAssertNil(emptyTaskName)

    }
    
    
}
