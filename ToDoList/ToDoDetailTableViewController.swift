//
//  ToDoDetailTableViewController.swift
//  ToDoList
//
//  Created by Dawin Ye on 2/8/20.
//  Copyright © 2020 Dawin Ye. All rights reserved.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var noteView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nameField: UITextField!
    var toDoItem: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.text = toDoItem
      
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        toDoItem = nameField.text
    }
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
    
    //@IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
//        let isPresentingInAddMode = presentingViewController is UINavigationController
//        if isPresentingInAddMode {
//            dismiss(animated: true, completion: nil)
//        }else{
//            navigationController?.popViewController(animated: true)

                
        }
    }
    
}
