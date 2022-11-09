//
//  AddModalView.swift
//  ToDoList5
//
//  Created by 박성민 on 2022/11/05.
//

import SwiftUI

struct AddModalView: View {
    
//    @ObservedObject var todoListModel: ToDoListModel
    @EnvironmentObject var todoListModel: ToDoListModel
    @State var date = Date()
    @State var toDo: String = ""
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack() {
            Color.brown
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack(){
                Text("새 할일을 입력해주세요")
                    .font(.largeTitle)
                    .foregroundColor(.brown)
                    .padding()
                
                DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
                    Text("날짜를 선택하세요")
                }
                .padding()
                
                TextField("할일을 적어주세요", text: $toDo)
                    .frame(height: 50)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                
                Button (action: saveButtonPressed, label: {
                    Text("저장")
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.brown)
                        .cornerRadius(15)
                        .padding()
                })
            }
        }
    }
    func saveButtonPressed() {
        todoListModel.addItem(title: toDo, date: date)
        presentation.wrappedValue.dismiss()
    }
}

struct AddModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddModalView()
            .environmentObject(ToDoListModel())
    }
}

