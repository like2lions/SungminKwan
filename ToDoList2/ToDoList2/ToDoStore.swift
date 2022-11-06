//
//  ToDoStore.swift
//  ToDoList2
//
//  Created by 박성민 on 2022/11/04.
//

import Foundation

import SwiftUI
import Combine


class ToDoStore : ObservableObject {
    
    @Published var toDoLists: [ToDoList]
    
//    init (toDoLists: [ToDoList]) {
//        self.toDoLists = toDoLists
//    }
    init (toDoLists: [ToDoList] = [ToDoList(date: "10월31일", checkBoxToDo: [CheckBoxToDo(checkBox: false, toDo: "오늘 할일"),CheckBoxToDo(checkBox: false, toDo: "모레 할일"),CheckBoxToDo(checkBox: false, toDo: "3일뒤 할일")])]) {
        self.toDoLists = toDoLists
    }
    
}

