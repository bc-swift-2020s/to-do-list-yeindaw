//
//  ViewController.swift
//  ToDoList
//
//  Created by Dawin Ye on 2/8/20.
//  Copyright © 2020 Dawin Ye. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var toDoArray = ["Learn Swift", "Build Apps", "Change the World", "Vacation"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}
extension ToDoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection was just called. Returning \(toDoArray.count) rows")
        return toDoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt was just called for indexPath.row = \(indexPath.row) which is the cell containing \(toDoArray[indexPath.row])")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = toDoArray[indexPath.row]
        return cell
    }
    
}
