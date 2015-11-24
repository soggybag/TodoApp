//
//  ViewController.swift
//  TodoApp
//
//  Created by mitchell hudson on 11/10/15.
//  Copyright © 2015 mitchell hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    // MARK: TableView Datasource methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 1
        }
        return TodoManager.sharedInstance.count
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // AddNewCell or cell
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("AddNewCell")!
            return cell
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        
        let todo = TodoManager.sharedInstance.todoAtIndex(indexPath.row)
        cell.textLabel?.text = todo.name
        
        setCheckmarkForCell(cell, completed: todo.completed)
        
        return cell
    }
    
    
    func setCheckmarkForCell(cell: UITableViewCell, completed: Bool) {
        if completed {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
    }
    
    
    
    
    // MARK: TableView Delegate Methods
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let todo = TodoManager.sharedInstance.todoAtIndex(indexPath.row)
        todo.completed = !todo.completed
        TodoManager.sharedInstance.saveContext()
        let cell = tableView.cellForRowAtIndexPath(indexPath)!
        setCheckmarkForCell(cell, completed: todo.completed)
    }
    
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.section == 1 {
            return false
        }
        return true
    }
    
    
    func tableView(tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath) {
            if editingStyle == .Delete {
                TodoManager.sharedInstance.removeTodoAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
            }
    }
    
    
    
    
    
    // MARK: View Lifecycle methods
    
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

