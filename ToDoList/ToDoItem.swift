//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Dawin Ye on 2/9/20.
//  Copyright © 2020 Dawin Ye. All rights reserved.
//

import Foundation

struct ToDoItem: Codable {
    var name: String
    var date: Date
    var notes: String
}
