//
//  ToDoList2App.swift
//  ToDoList2
//
//  Created by 박성민 on 2022/11/04.
//

import SwiftUI

@main
struct ToDoList2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(toDoStore : ToDoStore())
        }
    }
}
