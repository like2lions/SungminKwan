//
//  MonthView.swift
//  ToDoList5
//
//  Created by 박성민 on 2022/11/05.
//

import SwiftUI

struct MonthView: View {
    @ObservedObject var toDoStore : ToDoStore
    @State private var checkBoxToDo: CheckBoxToDo = CheckBoxToDo(checkBox: false, toDo: "")
    @State private var isShowingCalender: Bool = false
    @State private var date = Date()
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(
          byAdding: .year,
          value: -10,
          to: date
        )!
        let max = Calendar.current.date(
          byAdding: .year,
          value: 10,
          to: date
        )!
        return min...max
      }
    
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
            VStack{
                HStack{
                    Spacer()
                    Button("날짜추가", action: {
                        let newToDoList = ToDoList(date: date, checkBoxToDos: [])
                        
                        toDoStore.toDoLists.append(newToDoList)
                        isShowingCalender = false
                        
                    })
                        .background(.purple)
                        .padding()
                        .font(.largeTitle)
                    Button("달력버튼", action: { self.isShowingCalender.toggle()})
                        .background(.purple)
                        .padding()
                        .font(.largeTitle)
                }
                if isShowingCalender == true {
                    DatePicker(
                      "DatePicker",
                      selection: $date,
                      in: dateRange,
                      displayedComponents: [.date]
                    )
                      .datePickerStyle(.graphical)
                }
            }
            
        }
        .background(Color(hue: 0.129, saturation: 0.211, brightness: 0.979))

    }

}



struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView(toDoStore : ToDoStore())
    }
}

struct ListCell: View {
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    var toDoList: ToDoList
    
    var body: some View {
        
        Section(header: Text("\(toDoList.date, formatter: dateFormatter)")) {
            
            ForEach (toDoList.checkBoxToDos) { checkBoxToDo in
                CheckBoxToDoCell(checkBoxToDo: checkBoxToDo)
                
            }
//            .onDelete(perform: deleteItems)
        }
        
    }
//    func deleteItems(at offets: IndexSet) {
//        toDoList.checkBoxToDos.remove(atOffsets: offets)
//        print("Item moved")
//    }
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
