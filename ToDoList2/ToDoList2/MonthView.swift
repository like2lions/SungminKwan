//
//  MonthView.swift
//  ToDoList2
//
//  Created by 박성민 on 2022/11/04.
//

import SwiftUI

struct MonthView: View {
    
    @ObservedObject var toDoStore : ToDoStore = ToDoStore()
    
    var body: some View {
        VStack{
            Text("Month")
                .font(.largeTitle)
            List {
                ForEach (toDoStore.toDoLists) { toDoList in
                    ListCell(toDoList: toDoList)
                }
            }
            .background(Color(hue: 0.129, saturation: 0.211, brightness: 0.979))
            .scrollContentBackground(.hidden)
            .listStyle(.sidebar)
            .edgesIgnoringSafeArea(.bottom)
            HStack{
                Spacer()
                Button("addButton", action: {print("dd")})
                    .background(.red)
                    .padding()
            }
        }
        .background(Color(hue: 0.129, saturation: 0.211, brightness: 0.979))
    }
    
}
struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView()
    }
}



struct ListCell: View {
    
    @State var toDoList: ToDoList
    
    var body: some View {
        
        Section(header: Text(toDoList.date)) {
            
            
            ForEach (toDoList.checkBoxToDo) { checkBoxToDo in
                CheckBoxToDoCell(checkBoxToDo: checkBoxToDo)

            }
            .onDelete(perform: deleteItems)
        }
        
    }
    func deleteItems(at offets: IndexSet) {
        toDoList.checkBoxToDo.remove(atOffsets: offets)
        print("Item moved")
    }
}

struct CheckBoxToDoCell: View {
    
    @State var checkBoxToDo: CheckBoxToDo
    
    var body: some View {
        HStack{
            Button(
                action: {
                    self.checkBoxToDo.checkBox.toggle()
                },
                label: {
                    Image(systemName:
                            checkBoxToDo.checkBox == true
                        ? "xmark.square"
                        : "square"
                    )
                }
            )
            Text(checkBoxToDo.toDo)
        }
    }
}
