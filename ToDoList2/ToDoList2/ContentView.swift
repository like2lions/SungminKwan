//
//  ContentView.swift
//  ToDoList2
//
//  Created by 박성민 on 2022/11/04.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 1
    @ObservedObject var toDoStore : ToDoStore = ToDoStore()
    
    
    var body: some View {
        
        TabView(selection: $tabSelection) {
            NavigationStack {
                MonthView()
            }
            .tabItem {
                //여기는 h,v 안써도 알아서 해줌
                Image(systemName: "house.fill")
                Text("Month")
            }.tag(1)
            NavigationStack {
                MonthView()
            }
            .tabItem {
                //여기는 h,v 안써도 알아서 해줌
                Image(systemName: "house.fill")
                Text("Month")
            }.tag(1)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(toDoStore : ToDoStore())
    }
}
