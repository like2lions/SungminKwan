//
//  ListView.swift
//  ToDoList5
//
//  Created by zooey on 2022/11/06.
//

import SwiftUI

struct ListView: View {
    
//    @ObservedObject var todoListModel: ToDoListModel
    @State private var showModal = false
    @EnvironmentObject var todoListModel: ToDoListModel
    
    var body: some View {
        
        VStack {
            Text("ToDo")
                .font(.largeTitle)
                .foregroundColor(.brown)
                .padding(10)
            
            List {
                ForEach(todoListModel.toDoLists) { item in
                  AddView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            todoListModel.updateItem(item: item)
                        }
                    }
                }
                .onDelete(perform: todoListModel.deleteItem)
            }
            
            Button() {
                self.showModal = true
        
            } label: {
                Text("추가하기")
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.brown)
                    .cornerRadius(15)
                    .padding()
            }
            .sheet(isPresented: self.$showModal) {
                AddModalView()
                   .presentationDetents([.medium])
            }
        }
        .background(Color(hue: 0.129, saturation: 0.211, brightness: 0.979))
        .scrollContentBackground(.hidden)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(ToDoListModel())
    }
}
