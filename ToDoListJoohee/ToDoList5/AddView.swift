//
//  AddView.swift
//  ToDoList5
//
//  Created by zooey on 2022/11/07.
//

import SwiftUI

struct AddView: View {
    
    
    let item: ToDoList
    
    var body: some View {
        HStack() {
            Image(systemName: item.checkBox ? "checkmark.seal.fill" : "seal")
            Text(item.text)
            Text(item.date, style: .date)
            
        }
    }
}


