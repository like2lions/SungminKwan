//
//  ToDoList.swift
//  ToDoList
//
//  Created by 김응관 on 2022/11/06.
//

import SwiftUI

struct CheckBoxToDo: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var dates: Date
    var toDo: [String : Bool]
    var tasks: [String]
}

//체크박스랑 + 할일 같이 있는 목록
