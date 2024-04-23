//
//  informationView.swift
//  MD
//
//  Created by 문재윤 on 4/18/24.
//

import SwiftUI

struct informationView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                
                Text("소비일기")
                    .font(.largeTitle)
                Spacer()
                Text("간단한 일기로 소비를 기억하고 \n효율적인 소비생활을 만들어 보는 앱이에요!\n우측 상단의 글쓰기 버튼을 눌러 자유롭게 소비를 기록해보아요.\n지출을 기록하는 입력창과 소비를 기록하는 입력창 각각에 지출소비를 자유롭게 적으면 얼마나 썼는지 알아서 계산해줘요.\n정확한 숫자로 기입하는 것이 보다 정확하답니다!")
                
                
                
            }
            .padding(.bottom, 200)
            .padding(.top, 150)
            .padding(.horizontal, 20)
        }
        .scrollContentBackground(.hidden)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {dismiss()}, label: {
                    Text("뒤로")
                    .foregroundColor(.gray)})
            }
            
        }
    }
}

//#Preview {
//    informationView()
//}
