//
//  ToDoList5App.swift
//  ToDoList5
//
//  Created by 박성민 on 2022/11/05.
//

import SwiftUI

@main
struct ToDoList5App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(toDoStore : ToDoStore())
        }
    }
}
