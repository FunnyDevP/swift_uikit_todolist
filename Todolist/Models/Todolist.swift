//
//  Todolist.swift
//  Todolist
//
//  Created by Funny Dev on 1/16/22.
//

import Foundation


struct TodolistEnvelope {
    var categoryID: String
    var categoryName: String
    var todolist: [Todolist]

    var numberOfTodolist: Int {
        return todolist.count
    }
}


struct Todolist {
    var id: UUID
    var name: String
    var date: Date
}
