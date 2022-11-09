//
//  ToDoListStore.swift
//  ToDoList
//
//  Created by 김응관 on 2022/11/06.
//

import SwiftUI
import Combine


class ToDoStore : ObservableObject {
    @Published var toDoLists: [Date : CheckBoxToDo]
    @Published var dateLists: [Date]
//    @Published var pages: [Pages]
    
    init (toDoLists: [Date : CheckBoxToDo] = [:], dateLists: [Date] = []) {
        self.toDoLists = toDoLists
        self.dateLists = dateLists
//        self.pages = pages
    }
}

//struct Pages: View {
//    var dates: String
//    @ObservedObject var toDoStore: ToDoStore = ToDoStore()
//
//    var body: some View {
//        Text(dates)
//            .font(.largeTitle)
//            .fontWeight(.bold)
//    }
//}
