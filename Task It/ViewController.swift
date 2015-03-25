//
//  ViewController.swift
//  Task It
//
//  Created by Bjørn Rostad on 3/23/15.
//  Copyright (c) 2015 Bjørn Rostad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var taskArray:[TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let task1 = TaskModel(task: "Ride a goat", subTask: "Must be brown", date: "01/01/2014")
        let task2 = TaskModel(task: "Ride a whale", subTask: "Blue or white", date: "01/01/2015")
        let task3 = TaskModel(task: "Ride a cat", subTask: "Pink", date: "01/02/2015")
        
        
        taskArray = [task1, task2, task3]
        
        self.tableView.reloadData()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
        }
    }
    
    
    
    //  UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let thisTask = taskArray[indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = thisTask.date
        
        
        return cell
        
        
        
    }
    
    
    
    
    
    // UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }


}

