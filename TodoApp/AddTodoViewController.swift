//
//  AddTodoViewController.swift
//  TodoApp
//
//  Created by mitchell hudson on 11/10/15.
//  Copyright © 2015 mitchell hudson. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {

    
    // MARK: IBOutlets
    
    @IBOutlet weak var nameText: UITextField!
    
    
    
    // MARK: IBActions
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        TodoManager.sharedInstance.addNewTodoWithName(nameText.text!)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
