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
            VStack(alignment: .center, spacing: 24) { // 전체 세로 프레임
                VStack(alignment: .center, spacing: 18) { // 프로필 세로 프레임
                    VStack(alignment: .center, spacing: 10) {
                        Image("🎵")
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                          .frame(width: 86, height: 86)
                          .clipped()

                    }
                    .padding(0) 
                    .frame(width: 86, height: 86, alignment: .center)
                    .cornerRadius(10000)
                       
                    Text("@ Rundo")
                      .font(
                        .title2
                        .weight(.semibold)
                      )
                    HStack(alignment: .center, spacing: 2) { // 프로필 편집 버튼
                        // Subheadline/Emphasized
                        Text("프로필 편집")
                          .font(
                            .headline
                          )
                          .foregroundColor(.black)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color(.systemGray6))
                    .cornerRadius(60)
                }
                .padding(.vertical, 16)
                
                VStack() { // 내가 쓴 질문 + 질문 리스트
                    HStack(alignment: .center, spacing: 0) { // 내가 쓴 질문 가로 프레임 + 버튼
                        Text("내가 쓴 질문")
                            .font(
                                .title
                                .weight(.bold)
                            )
                        
                        Spacer()
                        
                        Button { // 질문 추가 버튼
//                            addItem() // 버튼 누르면 아이템 추가
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                        }
                    }
                    .padding(.horizontal, 16)
                    VStack() { // 질문 리스트 전체
                        HStack() { // 질문 리스트 하나

                        }
                    }
//                    List {
//                        ForEach($itemList) { $item in
//                            NavigationLink {
//                                // 아이템을 수정하는 화면으로 이동
//                                EditItemView(item: $item)
//                            } label: {
//                                HStack {
//                                    Label {
//                                        Text(item.text)
//                                    } icon: {
//                                        Text(item.type.icon)
//                                    }
//                                    
//                                    
//                                    Spacer()
//                                    Text(item.type.displayName)
//                                        .foregroundColor(.gray)
//                                }
//                            }
//                        }
//                        .onDelete(perform: deleteItem) // 스와이프로 삭제 기능 추가
//                    }
                    
                }
                Spacer()
                
            }
            .navigationTitle("마이홈")
        }
    }
}

#Preview {
    MyHomeView()
}
