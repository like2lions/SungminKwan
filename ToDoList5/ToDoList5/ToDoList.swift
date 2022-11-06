//
//  ToDoList.swift
//  ToDoList5
//
//  Created by 박성민 on 2022/11/05.
//

import SwiftUI


struct ToDoList : Codable, Identifiable {
    
    var id: UUID = UUID()
    var date: Date
    var checkBoxToDos: [CheckBoxToDo]
    
}

struct CheckBoxToDo: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var checkBox: Bool
    var toDo: String
}

