//
//  ToDoList.swift
//  ToDoList5
//
//  Created by 박성민 on 2022/11/05.
//

import Foundation

struct ToDoList : Identifiable, Codable {
    let id: String
    let date: Date
    let text: String
    let checkBox: Bool
    
    init(id: String = UUID().uuidString, date: Date, text: String, checkBox: Bool) {
        self.id = id
        self.date = date
        self.text = text
        self.checkBox = checkBox
    }
    
    func updateCompletion() -> ToDoList {
        return ToDoList(id: id, date: date, text: text, checkBox: !checkBox)
    }
    
}



