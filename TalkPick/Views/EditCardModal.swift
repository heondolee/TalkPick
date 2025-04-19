//
//  EditCardModal.swift
//  TalkPick
//
//  Created by rundo on 4/19/25.
//

import SwiftUI

struct EditCardModal: View {
    
    @Environment(\.dismiss) private var dismiss  // 모달 닫기용
    
    let userId: UUID // 유저 아이디를 받는다
    
    @Environment(\.modelContext) private var context
    @State private var viewModel: CardViewModel?
    
    @StateObject private var searchVM = SearchViewModel()
    @State private var selectedTitle: String = "카테고리 선택"
    
    var categoryTitles: [String] {
        searchVM.topicSections.flatMap { $0.cards.map { $0.title } }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            HStack(alignment: .center) {
                Button {
                    dismiss()
                } label: {
                    Text("취소")
                      .font(
                        .headline
                        .bold()
                      )
                      .foregroundColor(.red)
                }
                
                Spacer()
                
                Text("새로운 질문")
                  .font(
                    .headline
                    .bold()
                  )
                  .foregroundColor(.black)
                
                Spacer()

                
                Button {
                    
                } label: {
                    Text("생성")
                      .font(
                        .headline
                        .bold()
                      )
                      .foregroundColor(.red)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            .background(Color.red.opacity(0.1))
            
            HStack {
                
                Spacer()
                
                Menu {
                    Picker(selection: $selectedTitle, label: EmptyView()) {
                        ForEach(categoryTitles, id: \.self) { title in
                            Text(title).tag(title)
                        }
                    }
                } label: {
                    HStack {
                        Text(selectedTitle.isEmpty ? "카테고리 선택" : selectedTitle)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                }
            }
            .padding(.horizontal, 16)
            
            Spacer()
        }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.opacity(0.1))
    }
}

#Preview {
    EditCardModal(userId: UUID())
}
