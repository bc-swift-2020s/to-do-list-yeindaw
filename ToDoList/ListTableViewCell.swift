//
//  ListTableViewCell.swift
//  ToDoList
//
//  Created by Dawin Ye on 3/4/20.
//  Copyright © 2020 Dawin Ye. All rights reserved.
//

import UIKit

protocol ListTableViewCellDelegate: class {
    func checkBoxToggle(sender: ListTableViewCell)
}
class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    weak var delegate: ListTableViewCellDelegate?
    
    var toDoItem: ToDoItem! {
        didSet {
            nameLabel.text = toDoItem.name
            checkBoxButton.isSelected = toDoItem.completed
        }
    }
    @IBAction func checkToggled(_ sender: UIButton) {
        delegate?.checkBoxToggle(sender: self)
    }
}
