//
//  StartView.swift
//  ToDoList
//
//  Created by 박성민 on 2022/11/09.
//

import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct StartView: View {
    
    @Binding var isLogin: Bool
    
    var body: some View {
        VStack {
            Spacer().frame(height: 150)
            ZStack{
                Image("balloon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text("Quokka List")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.brown1)
            }
            Image("quokkaLogin")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button {
                isLogin.toggle()
                // Github User API 연결, 데이터 저장하기
            } label: {
                Text("Quokka List Start")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: UIScreen.screenWidth - 40, maxHeight: UIScreen.screenHeight / 17)
                    .foregroundColor(.brown4)
            }
            .padding(.horizontal)
            .buttonStyle(.borderedProminent)
            .tint(Color.brown2)
            .shadow(color: Color(.brown), radius: 1)
        }
        .background(Color.brown4)
    }
}
//
//
//struct StartView_Previews: PreviewProvider {
//    static var previews: some View {
//        StartView()
//    }
//}
