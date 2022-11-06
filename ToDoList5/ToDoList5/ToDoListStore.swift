//
//  ToDoListStore.swift
//  ToDoList5
//
//  Created by 박성민 on 2022/11/05.
//

import Foundation

import SwiftUI
import Combine


class ToDoStore : ObservableObject {
    
    @Published var toDoLists: [ToDoList]
    
//    init (toDoLists: [ToDoList]) {
//        self.toDoLists = toDoLists
//    }
    init (toDoLists: [ToDoList] = []) {
        self.toDoLists = toDoLists
    }
    
}

//class CheckBoxToDoStore : ObservableObject {
//
//    @Published var checkBoxToDos: [CheckBoxToDo]
//
////    init (toDoLists: [ToDoList]) {
////        self.toDoLists = toDoLists
////    }
//    init (checkBoxToDos: [CheckBoxToDo] = []) {
//        self.checkBoxToDos = checkBoxToDos
//    }
//}
