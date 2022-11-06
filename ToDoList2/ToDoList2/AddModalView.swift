//
//  AddModalView.swift
//  ToDoList2
//
//  Created by 박성민 on 2022/11/04.
//

import SwiftUI

struct AddModalView: View {
    @ObservedObject var toDoStore : ToDoStore
    
    @State var date: String = ""
    @State var toDo: String = ""
    @State var checkBox: Bool = false
    
    
    var body: some View {
        VStack{
            Text("새 할일을 입력해주세요")
            TextField("날짜를 입력해주세요", text: $date)
            //        TextField("날짜를 입력해주세요", text: $newToDoList.date)
            TextField("할일을 적어주세요", text: $toDo)
            //        TextField("할일을 적어주세요", text: $newCheckBoxToDo.toDo)
            
            Button(action: addToDoList) {
                Text("Add ToDoList")
            }
        }
        
    }
    func addToDoList() {
        let newToDoList = ToDoList(date: date, checkBoxToDo: [CheckBoxToDo(checkBox: checkBox, toDo: toDo)])
        
        toDoStore.toDoLists.append(newToDoList)
    }
}




struct AddModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddModalView(toDoStore : ToDoStore())
    }
}
