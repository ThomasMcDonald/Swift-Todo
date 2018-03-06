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
        
        TaskCounter = 0
        
        // If the string is empty, it should return without incrementing the counter
        if(Tasks.text == ""){TaskCount.text = "You have 0 items in your list"}
        
        let text = Tasks.text.split(separator: "\n")
        TaskCounter = text.count;
        TaskCount.text = " You have \(TaskCounter) items in your list"
        
        //did this before i realised there was a count function for a string.
        /*
        for index in Tasks.text{
            if(index == "\n"){TaskCounter += 1;}
        }
        */
        
        
    }

}

