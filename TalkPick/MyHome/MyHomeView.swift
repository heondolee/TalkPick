//
//  MyHomeView.swift
//  TalkPick
//
//  Created by rundo on 4/14/25.
//

import SwiftUI

struct MyHomeView: View {   
    var body: some View {
        NavigationStack {
            VStack() { // 전체 세로 프레임
                VStack() { // 프로필 세로 프레임
                    
                }
                VStack() { // 내가 쓴 질문 + 질문 리스트
                    HStack() {
                        Text("내가 쓴 질문")
                            .font(.headline)
                        Button { // 질문 추가 버튼
//                            addItem() // 버튼 누르면 아이템 추가
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                        }
                    }
                    VStack() { // 질문 리스트
                        HStack() { // 질문 리스트 하나
                            
                        }
                    }
                    
                }
                
            }
            .navigationTitle("마이홈")
        }
    }
}

#Preview {
    MyHomeView()
}
