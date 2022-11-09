




import SwiftUI

struct MonthView: View {
    @State private var now = Date()
    //현재 날짜
    @ObservedObject var toDoStore: ToDoStore = ToDoStore()
    //리스트 담을 객체 (딕셔너리 형태임)
    @State private var months: String = "2022-11"
    
    var wrappedValue: String {
        get { months }
        set {
            months = formatter.string(from: now)
        }
    }
    
    @State private var interval: Double = 0
    //오늘 날짜에서 이제 몇일? 떨어진 날짜 표시할지 정해주는..
    @State private var isShowingCalender: Bool = false
    @State private var formatter = DateFormatter()
    //@State private var flag = 0
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(Color.brown4)
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    HStack{
                        Spacer()
                        Text("[ To do list ]")
                            .font(.title)
                            .foregroundColor(Color.brown1)
                            .bold()
                        Spacer()
                    }
                    .listRowBackground(Color.brown4)
                    ForEach(toDoStore.dateLists, id:\.self) { item in
                        ListCell(now: item, toDoStore: toDoStore, isShowingCalender: $isShowingCalender)
                    }.listRowBackground(Color.brown1)
                }
                
                .listStyle(.sidebar)
                .background(Image("quokkaBack"))
                .background(Color.brown4)

                .scrollContentBackground(.hidden)

                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            if toDoStore.dateLists.contains(now) == false {
                                let checkBoxToDo = CheckBoxToDo(dates: now, toDo: [:], tasks: [])
                                toDoStore.toDoLists[now] = checkBoxToDo
                                toDoStore.dateLists.append(now)
                                
                                toDoStore.dateLists = toDoStore.dateLists.sorted(by: {
                                    $0.compare($1) == .orderedAscending
                                })
                                //날짜 오름차순으로 저장
                            }
                        }){
                            Image(systemName: "plus").foregroundColor(.brown1)
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        //.principal - 중앙에 배치
                        HStack {
                            Button(action: {
                                LastMonth()
                            }){
                                Image(systemName: "arrow.left").foregroundColor(.brown1)
                            }
                            Text(wrappedValue).foregroundColor(.brown1)
                            Button(action: {
                                NextMonth()
                            }){
                                Image(systemName: "arrow.right").foregroundColor(.brown1)
                            }
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            self.isShowingCalender.toggle()
                        }){
                            Image(systemName: "calendar")
                                .resizable()
                                .foregroundColor(.brown1)
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
    var now: Date
    @ObservedObject var toDoStore: ToDoStore = ToDoStore()
    @Binding var isShowingCalender: Bool
    var mustDo: String = "2"
    @State private var showTextField = false
    @State private var alertInput = ""
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 MM월 dd일"
        return formatter
    }
    
    var body: some View {
            Section(header:
                        HStack {
                Text("\(now, formatter: dateFormatter)")
                    .font(.headline)
                    .bold()
                    .foregroundColor(Color.brown1)
                Button(action: {
                    //팝업 띄워서 일정 입력받기
                    //입력한 일정을 toDo에 넣어준다
                    if isShowingCalender == true {
                        isShowingCalender.toggle()
                    }
                    showTextField = true
                })
                {
                    Image(systemName: "plus").foregroundColor(Color.brown1)
                }
                .alert("To Do", isPresented: $showTextField, actions: {
                    TextField("할일을 입력하세요", text: $alertInput)
                    Button("등록", action: {
                        toDoStore.toDoLists[now]!.toDo[alertInput] = false
                        if alertInput != "" {
                            toDoStore.toDoLists[now]!.tasks.append(alertInput)
                            alertInput = ""
                        }
                    })
                }, message: {
                    Text("\(now, formatter: dateFormatter)에 할일을 입력하시오")
                })
            })
            {
                ForEach(toDoStore.toDoLists[now]!.tasks, id:\.self) { task in
                    CheckBoxToDoCell(toDoStore: toDoStore, isShowingCalender: $isShowingCalender,tasks: task, dates: now)
                }
                .onDelete(perform: deleteItems)
        }
            
    }
    
    func deleteItems(at offets: IndexSet) {
        toDoStore.toDoLists[now]!.tasks.remove(atOffsets: offets)
    }
}

struct CheckBoxToDoCell: View {
    @ObservedObject var toDoStore: ToDoStore
    @Binding var isShowingCalender: Bool

    var tasks: String
    var dates: Date
    
    var body: some View {
        HStack{
            Button(
                action: {
                    toDoStore.toDoLists[dates]!.toDo[tasks]!.toggle()
                    if isShowingCalender == true {
                        isShowingCalender.toggle()
                    }
                },
                label: {
                    Image(systemName:
                        toDoStore.toDoLists[dates]!.toDo[tasks]! == true
                        ? "xmark.square"
                        : "square"
                    ).foregroundColor(Color.brown4)
                }
            )
            Text(tasks).foregroundColor(Color.brown4)
        }
    }
}

struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView()
    }
}
