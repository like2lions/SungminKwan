//
//  ContentView.swift
//  ToDoList
//
//  Created by 김응관 on 2022/11/04.
//

import SwiftUI

struct ContentView: View {
    @State private var isLogin: Bool = true
    
    var body: some View {
        ZStack {
            MonthView()
        }
        .fullScreenCover(isPresented: $isLogin) {
            StartView(isLogin: $isLogin)
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
