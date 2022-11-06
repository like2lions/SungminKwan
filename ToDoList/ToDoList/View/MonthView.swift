




import SwiftUI

struct MonthView: View {
    @State private var now = Date()
    @ObservedObject var toDoStore: ToDoStore = ToDoStore()
    @State private var checkBoxToDo: CheckBoxToDo = CheckBoxToDo(checkBox: false, toDo: "")
    @State private var toDoList: ToDoList = ToDoList(date: Date(), checkBoxToDos: [])
    @State private var months: String = "2022-11"
    
    var wrappedValue: String {
        get { months }
        set {
            months = formatter.string(from: now)
        }
    }
    
//    func updates() -> String {
//        months = formatter.string(from: now)
//        return months
//    }
    @State private var interval: Double = 0
    //오늘 날짜에서 이제 몇일? 떨어진 날짜 표시할지 정해주는..
    @State private var isShowingCalender: Bool = false
    @State private var formatter = DateFormatter()
    
//    var dateRange: ClosedRange<Date> {
//        let min = Calendar.current.date(
//          byAdding: .year,
//          value: -10,
//          to: now
//        )!
//        let max = Calendar.current.date(
//          byAdding: .year,
//          value: 10,
//          to: now
//        )!
//        return min...max
//    }
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(toDoStore.toDoLists) { toDoList in
                        ListCell(now: $now, toDoList: toDoList)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            let newToDoList = ToDoList(date: now, checkBoxToDos: [])
                            toDoStore.toDoLists.append(newToDoList)

                        }){
                            Text("Add")
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        //.principal - 중앙에 배치
                        HStack {
                            Button(action: {
                                LastMonth()
                            }){
                                Image(systemName: "arrow.left")
                            }
                            Text(wrappedValue)
                            Button(action: {
                                NextMonth()
                            }){
                                Image(systemName: "arrow.right")
                            }
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            self.isShowingCalender.toggle()
                        }){
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 35, height: 30)
                        }
                    }
                }
                if isShowingCalender {
                    DatePicker(
                        "",
                        selection: $now,
                        displayedComponents: [.date]
                    )
                    .padding()
                    .datePickerStyle(.graphical)
                }
                
            }
        }
    }
    
    
    func NextMonth() {
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yyyy-MM"
        
        interval = Double(60*60*24*30)
        now = Date(timeInterval: interval, since: now)
        
        months = formatter.string(from: now)
    }
    
    func LastMonth() {
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yyyy-MM"
        
        interval = Double(60*60*24*30) * -1.0
        now = Date(timeInterval: interval, since: now)
        
        months = formatter.string(from: now)
    }
    
}

struct ListCell: View {
    @Binding var now: Date
    
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

struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView()
    }
}
