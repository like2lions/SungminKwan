//
//  ToDoListStore.swift
//  ToDoList5
//
//  Created by 박성민 on 2022/11/05.
//

import Foundation

class ToDoListModel : ObservableObject {
    
    @Published var toDoLists: [ToDoList] = [] {
        didSet {
            saveItems()
        }
    }

    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ToDoList].self, from: data)
        else { return }
       
        self.toDoLists = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        toDoLists.remove(atOffsets: indexSet)
    }
    
    func addItem(title: String, date: Date) {
        let newItem = ToDoList(date: date, text: title, checkBox: false)
        toDoLists.append(newItem)
    }
    
    func updateItem(item: ToDoList) {
        if let index = toDoLists.firstIndex(where: { $0.id == item.id}) {
            toDoLists[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(toDoLists) {
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }
    
}

