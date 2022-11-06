//
//  ToDoList.swift
//  ToDoList
//
//  Created by 김응관 on 2022/11/06.
//

import SwiftUI

struct ToDoList : Codable, Identifiable {
    
    var id: UUID = UUID()
    var date: Date
    var checkBoxToDos: [CheckBoxToDo]
}
//date를 기준으로 section을 만들어서 할일 목록 리스트들을 나열한다

struct CheckBoxToDo: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var checkBox: Bool
    var toDo: String
}
//체크박스랑 + 할일 같이 있는 목록
