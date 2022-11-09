//
//  ExtensionColor.swift
//  ToDoList
//
//  Created by 박성민 on 2022/11/09.
//

import SwiftUI

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}

extension Color {
 
    static let brown1 = Color(hex: "AD8B73")
    static let brown2 = Color(hex: "CEAB93")
    static let brown3 = Color(hex: "E3CAA5")
    static let brown4 = Color(hex: "FFFBE9")// #을 제거하고 사용해도 됩니다.
}
