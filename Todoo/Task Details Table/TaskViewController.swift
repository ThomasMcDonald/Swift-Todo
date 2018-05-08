//
//  Task.swift
//  Todoo
//
//  Created by Thomas McDonald on 21/3/18.
//  Copyright © 2018 Thomas McDonald. All rights reserved.
//

import UIKit
import os.log
/**
This class handles all the task details, depending on the segue that sent it, it will populate the
 textfield and datepicker with values to edit or leave blank for the user to add a new task.
 */
class TaskViewController: UIViewController, UITextFieldDelegate,UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var TaskName: UITextField! // This outlet belongs to the TaskName UItextfield
    @IBOutlet weak var SaveButton: UIBarButtonItem! // This outlet belongs to the SaveButton UIBarButtonItem
    
    
    @IBOutlet weak var tableView: UITableView!
    let section = ["History","Collaborators"];
    
    

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return section.count;
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return 0;
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mycell")
    
        return cell
    }
    
    
   

 
    var task: Task?; // Optional Task variable, will have a value depending if a task is being edited or not
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TaskName.delegate = self;
        print("loading task");
        if let task = task{ // If true then a task is being edited and all the UI fields should be filled accordingly
            navigationItem.title = "Edit Details" // Change Navigation Title to `Edit Details`
            TaskName.text = task.taskName; // Assign currently editing taskName to the TaskName UItextfield
            print("editing task");
        }
        updateSaveButtonState() //Updates the Save button to Enabled or Disabled depending on the result of if let task.
    }

    //Sent to the view controller when the app receives a memory warning.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Asks the delegate if the text field should process the pressing of the return button.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true;
    }
    
    //Ends the editing of the and calls the updateSaveButtonState() function
    func textFieldDidEndEditing(_ textField: UITextField){
        updateSaveButtonState()
        
    }
    ///Notifies the View controller that a segue is about to be performed
    ///it formats the the date into a string.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            super.prepare(for: segue, sender: sender);
        //These handle the date Picker value and format, converts the datepicker value to a string
        //to view in the table row
        var date = "05/05/2016" // Sets the initial date to a nil string to prevent error
      
        //////
        
        //Checks for button clicks, if it was the save button continue, continue.
        // Else it assumes it was the cancel button
        guard let button = sender as? UIBarButtonItem, button === SaveButton else{
                os_log("Save button wasnt pressed, cancelling item creation", log: OSLog.default, type: .debug)
                return
            }
        
        let name = TaskName.text ?? "" // make sure TaskName is never Nil
        // If the Datepicker was hidden set the date to an initial value of ``
        //else assign the formattedDate to date

        task = Task(taskName:name,dueDate:date,taskCompleted:false,history: ["date":"11-Apr-2018", "comments":"created"]);
    }
    
  
    /**
     This function is called in the textFieldDidEndEditing(_ textField: UITextField) function
     It pulls the contents of the `TaskName` textfield and checks if it is empty.
     If TaskName isnt equal to nil, then enable the Showbutton
     else the TaskName is empty and it wont enable the SaveButton
    */
    private func updateSaveButtonState(){
        let text = TaskName.text ?? "";
        SaveButton.isEnabled = !text.isEmpty;
    }
    

   
}

