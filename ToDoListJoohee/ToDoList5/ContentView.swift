//
//  ContentView.swift
//  ToDoList5
//
//  Created by 박성민 on 2022/11/05.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelection = 1
//    @ObservedObject var todoListModel: ToDoListModel
    @EnvironmentObject var todoListModel: ToDoListModel
    
    var body: some View {
        
        TabView(selection: $tabSelection) {
            ListView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Todo")
                }.tag(1)
            MonthView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("calendar")
                }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ToDoListModel())
    }
}
