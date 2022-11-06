//
//  ToDoListStore.swift
//  ToDoList
//
//  Created by 김응관 on 2022/11/06.
//

import SwiftUI
import Combine


class ToDoStore : ObservableObject {
    @Published var toDoLists: [ToDoList]
    
    init (toDoLists: [ToDoList] = []) {
        self.toDoLists = toDoLists
    }
    
}
