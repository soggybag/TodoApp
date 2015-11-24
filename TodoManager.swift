//
//  TodoManager.swift
//  TodoApp
//
//  Created by mitchell hudson on 11/10/15.
//  Copyright © 2015 mitchell hudson. All rights reserved.
//

import UIKit
import CoreData

class TodoManager {
    // Singleton
    static let sharedInstance = TodoManager()
    
    private var todos = [Todo]()
    let context: NSManagedObjectContext!
    
    var count: Int {
        get {
            return todos.count
        }
    }
    
    
    func todoAtIndex(index: Int) -> Todo {
        return todos[index]
    }
    
    
    func addNewTodoWithName(name: String) {
        let todo = NSEntityDescription.insertNewObjectForEntityForName("Todo",
            inManagedObjectContext: context) as! Todo
        
        todo.name = name
        todo.completed = false
        
        todos.append(todo)
        
        saveContext()
    }
    
    
    func removeTodoAtIndex(index: Int) {
        context.deleteObject(todoAtIndex(index))
        todos.removeAtIndex(index)
        saveContext()
    }
    
    
    
    func saveContext() {
        do {
            try context.save()
        } catch let error as NSError {
            print("Error saving context: \(error), \(error.userInfo)")
        }
    }
    
    
    
    
    
    func fetchTodos() {
        let fetchRequest = NSFetchRequest(entityName: "Todo")
        
        do {
            // try
            let results = try context.executeFetchRequest(fetchRequest)
            todos = results as! [Todo]
        } catch let error as NSError {
            print("Could not fetch todos: \(error), \(error.userInfo)")
        }
    }
    
    
    // MARK: Init
    
    private init() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        context = appDelegate.managedObjectContext
        fetchTodos()
    }
}



