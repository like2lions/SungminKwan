//
//  MonthView.swift
//  ToDoList5
//
//  Created by 박성민 on 2022/11/05.
//

import SwiftUI

struct MonthView: View {
    //@ObservedObject var todoListModel: ToDoListModel
    @EnvironmentObject var todoListModel: ToDoListModel
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
            Text("Calendar")
                .font(.largeTitle)
                .foregroundColor(.brown)
                .padding()
            DatePicker(
                "DatePicker",
                selection: $date,
                in: dateRange,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            List {
                ForEach (todoListModel.toDoLists) { item in
                    ListCell(toDoList: item)
                }
            }
            .background(Color(hue: 0.129, saturation: 0.211, brightness: 0.979))
            .scrollContentBackground(.hidden)
            .listStyle(.sidebar)
            .edgesIgnoringSafeArea(.bottom)
            
        }
        .background(Color(hue: 0.129, saturation: 0.211, brightness: 0.979))

    }

}



struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView()
            .environmentObject(ToDoListModel())
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
            
          
                
            
        }
        
    }

}

