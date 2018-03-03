//
//  ViewController.swift
//  ToDoo
//
//  Created by Thomas McDonald on 3/3/18.
//  Copyright © 2018 Thomas McDonald. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Tasks: UITextView!
    @IBOutlet weak var TaskCount: UILabel!
    public var TaskCounter = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    func textFieldShouldReturn(_ Tasks: UITextField) -> Bool {
        Tasks.resignFirstResponder()
        return true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CountTasks(_ sender: UIButton) {
        
        TaskCounter = 0 // Reset the counter each time the button is clicked
        if(Tasks.text == ""){return} // If the string is empty, it should return without incrementing the counter
        
        //Loop through String and check for newline characters(increment by 1 when found)
        for index in Tasks.text{
            if(index == "\n" ){TaskCounter += 1;}

        }
        TaskCounter += 1; // Increment by 1 just in case use doesnt go to new line
        TaskCount.text = " You have \(TaskCounter) items in your list"
        
        
    
    }

}

