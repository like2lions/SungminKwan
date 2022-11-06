//
//  AddModalView.swift
//  ToDoList5
//
//  Created by 박성민 on 2022/11/05.
//

import SwiftUI

struct AddModalView: View {
    @ObservedObject var toDoStore : ToDoStore
    
    @State var toDoList: ToDoList = ToDoList(date: Date(), checkBoxToDos: [])
    @State var checkBoxToDo: CheckBoxToDo = CheckBoxToDo(checkBox: false, toDo: "")
    @State var date = Date()
    @State var toDo: String = ""
    @State var checkBox: Bool = false
    
    
    var body: some View {
        VStack{
            Text("새 할일을 입력해주세요")
            DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
                Text("날짜를 선택하세요")
            }            //        TextField("날짜를 입력해주세요", text: $newToDoList.date)
            TextField("할일을 적어주세요", text: $toDo)
            //        TextField("할일을 적어주세요", text: $newCheckBoxToDo.toDo)
            
            Button(action: addToDoList) {
                Text("Add To Do List")
            }
        }
        
    }
    func addToDoList() {
        let newToDoList = ToDoList(date: date, checkBoxToDos: [checkBoxToDo])

        toDoStore.toDoLists.append(newToDoList)
    }
}




struct AddModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddModalView(toDoStore : ToDoStore())
    }
}

