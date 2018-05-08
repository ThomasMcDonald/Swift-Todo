//
//  Task.swift
//  Todoo
//
//  Created by Thomas McDonald on 21/3/18.
//  Copyright © 2018 Thomas McDonald. All rights reserved.
//

import UIKit
import os.log


class TaskTableViewController: UITableViewController {

    var editableTask:Int?; // Keeps track of the task being edited
    var editableSection:Int?;
    var tasks = [Task?]();
    let section = ["Yet to do", "Completed"];
    var tasksCompleted = 0;
    var tasksinComplete = 0;
    var data = [[Task?](), [Task?]()];
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem // Enables Editing of the table contents
        
        LoadDefaultTasks(); // Loads default data into the tasks array

     
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
   
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    
    //returns the number of sections in the table
    override func numberOfSections(in tableView: UITableView) -> Int {
        return section.count;
    }

    //Returns the number of rows currently in the Table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count

    }

   
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.data[sourceIndexPath.section][sourceIndexPath.row]
            data[sourceIndexPath.section].remove(at:sourceIndexPath.row);
            data[destinationIndexPath.section].insert(movedObject, at: destinationIndexPath.row)
   
       // self.tableView.reloadData()
    }
    
    
    @IBAction func unwindToTaskList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? TaskViewController, let task = sourceViewController.task {
            if editableTask != nil{// if the editable task is not nil then a task was edited.
                data[editableSection!][editableTask!] = task // Updates the edited task in the tasks array.
                //Reloads the tableView with the updated task details
                tableView.reloadRows(at: [IndexPath(row:editableTask!,section:editableSection!)], with: .none)
                editableTask = nil; // Resets the editableTask variable to nil to prevent editing when creating a new Task
                editableSection = nil;
            }
            else {
                print("trying to save new item");
                let newIndexPath = IndexPath(row: tasks.count, section: 0) // Gets the indexpath at the end of the tableView
                data[0].append(task); // new task goes to the top
                tableView.insertRows(at: [newIndexPath], with: .automatic)//Inserts a new row to the end of the tableView
                tableView.reloadSections(IndexSet(integersIn: 0...0), with: .none)
            }
        }
    }


    /**
     Loads default tasks into the task array
     This function is called in the ViewDidLoad() function
     */
    private func LoadDefaultTasks(){
        let task1 = Task(taskName: "Task 1", dueDate: "11-Apr-2018", taskCompleted: false, history: ["date":"11-Apr-2018", "comments":"created"]);
        let task2 = Task(taskName: "Task 2", dueDate: "12-Apr-2018", taskCompleted: false,history: ["date":"11-Apr-2018", "comments":"created"]);
        data[0] += [task1,task2];
        let task3 = Task(taskName: "Task 3", dueDate: "11-Apr-2018", taskCompleted: true,history: ["date":"11-Apr-2018", "comments":"created"]);
        let task4 = Task(taskName: "Task 4", dueDate: "12-Apr-2018", taskCompleted: true,history: ["date":"11-Apr-2018", "comments":"created"]);
        data[1] += [task3,task4]; // adds the default Task data to the tasks array
    }
    
    
    /**
     Asks the data source for a cell to insert in a particular location of the table view.
     
     - Parameters:
         tableView: A table-view object requesting the cell.
         indexPath: An index path locating a row in tableView.

     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TaskTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TaskTableViewCell
            else{fatalError("Dequeued cell reallocation didnt work")}
        let cellText = data[indexPath.section][indexPath.row]?.taskName;
        
        cell.accessoryType = .none;
        cell.editingAccessoryType = .detailButton
        cell.TaskName.text = cellText;
    
        
        return cell
        
       
        
    }
    

    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data[indexPath.section].remove(at:indexPath.row);
            tableView.deleteRows(at: [indexPath], with: .fade) // Deletes the row from the table view
        }
    }

    /** Gives the user the ability to edit the table */
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
   
    
    
   
    /**
    Selects the row, places the accessory type of checkmark then deselects the row.
     
     - Parameters:
             tableView: A table-view object informing the delegate about the new row selection.
             indexPath: An index path locating the new selected row in tableView.
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
                cell.accessoryType = .checkmark // sets the checkmark accessory to the row
            tableView.deselectRow(at: indexPath, animated: true) //Deselects row to not interfere with the edit function
            }
    }

    
    
    /**
     Prepares the given segue.
     if AddItem segue is called, then it will move to the create Task View
     If ShowTaskDetails is called.
     
     - Parameter sender: The object that called this function.
     
     - Throws: `Unexpected destination:` when the destination is not known.
     - Throws: `Unexpected sender:` when the sender is not known
     - Throws: `The selected cell is not being displayed by the table` when the selected row isnt being displayed in the table
     - Throws: `Unexpected Segue Identifier` when the segue isnt a known segue
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for:segue,sender:sender);
        
        switch(segue.identifier ?? ""){
        case "AddItem": // This Segue is triggered when the + was pressed
                os_log("Adding a new Task.",log: OSLog.default, type: .debug) //Outputs that the Segue is triggered correctly
        case "ShowTaskDetails": // This Segue is triggered when the .detailButton accessory item is pressed
                os_log("Editing Task",log: OSLog.default, type: .debug)
                
            // Sets the Segue destination to the TaskDetailViewController.
            guard let TaskDetailViewController = segue.destination as? TaskViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            // assigns the currently editable task Row to the selectedTaskCell variable
            guard let selectedTaskCell = sender as? TaskTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            // assigns the currently editable task Row tableView.indexPath to the indexPath variable
            guard let indexPath = tableView.indexPath(for: selectedTaskCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            editableTask = indexPath.row; // assigns the currently editable row value to the editableTask variable
            editableSection = indexPath.section;
            let selectedTask = data[indexPath.section][indexPath.row] // assigns the currently editable task to the selectedTask variable
            // assigns the currently editable task to the TaskDetailViewController.task variable which can be accessed from the TaskViewController
            TaskDetailViewController.task = selectedTask
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    

}
