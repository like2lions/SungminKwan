//
//  TodoList.swift
//  ToDoList2
//
//  Created by 박성민 on 2022/11/04.
//

import SwiftUI


struct ToDoList : Codable, Identifiable {
    
    var id: UUID = UUID()
    var date: String
    var checkBoxToDo: [CheckBoxToDo]
    
}

struct CheckBoxToDo: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var checkBox: Bool
    var toDo: String
}

