//
//  EditCardModal.swift
//  TalkPick
//
//  Created by rundo on 4/19/25.
//

import SwiftUI
import SwiftData

struct EditCardModal: View {
    
    @Environment(\.dismiss) private var dismiss  // 모달 닫기용
    @Environment(\.modelContext) private var context
    
    let userId: UUID // 유저 아이디를 받는다
    @State private var user: User?

    @State private var cardVM: CardViewModel?
    
    @StateObject private var searchVM = SearchViewModel()
    
    
    @State private var selectedTitle: String = "카테고리 선택"
    @State private var inputQuestion: String = ""
    @State private var inputImageName: String = ""
    
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
                    let newCard = Card(
                        author: nil,
                        question: inputQuestion,
                        title: selectedTitle,
                        likes: 0,
                        dislikes: 0,
                        image: inputImageName.isEmpty ? nil : inputImageName,
                        updatedAt: .now
                    )
                    context.insert(newCard)
                    try? context.save()
                    dismiss()
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
            
            VStack(alignment: .center, spacing: 32) {
                Spacer()
                
                TextField("이미지 이름 입력", text: $inputImageName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 24)
                
                if !inputImageName.isEmpty {
                    Image(inputImageName)
                        .resizable() // 크기 조절이 가능하게 한다.
                        .scaledToFit() // 비율을 유지하며 크기를 키운다.
                        .frame(width: 80, height: 80)
                        .cornerRadius(16)
                }
                
                ZStack(alignment: .topLeading) {
                    // 플레이스홀더 텍스트
                    if inputQuestion.isEmpty {
                        Text("질문을 입력하세요")
                            .font(.system(size: 18, weight: .bold))

                            .foregroundColor(.gray)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 24)
                    }

                    TextEditor(text: $inputQuestion)
                                    .font(.system(size: 18, weight: .bold))

                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, minHeight: 281, maxHeight: 281, alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 15)
                        .background(.white.opacity(0.77))
                        .scrollContentBackground(.hidden)
                        .cornerRadius(10)
                }
                
                HStack() {
                    Spacer()
                    
                    HStack(alignment: .center, spacing: 8) {
                        Rectangle()
                          .foregroundColor(.clear)
                          .frame(maxWidth: .infinity, maxHeight: .infinity)
                          .background(
                            Image(systemName: "hand.thumbsup")
                              .resizable()
                              .aspectRatio(contentMode: .fill)
                              .frame(width: 18, height: 18)
                              .clipped()
                          )
                        Text("@\(user?.name ?? "알 수 없음")")
                          .font(
                            Font.custom("SF Pro", size: 13)
                              .weight(.semibold)
                          )

                    }
                    .padding(.leading, 5)
                    .padding(.trailing, 10)
                    .padding(.vertical, 6)
                    .padding(.leading, 5)
                    .fixedSize()
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.33))
                    .cornerRadius(16)
                }
                .offset(x: 14) // 오른쪽으로 14만큼 이동 → 부모 패딩을 벗어남

            }
            .padding(.horizontal, 24)
            .padding(.bottom, 10)
            .frame(width: 324, height: 483, alignment: .bottom)
            .background(
              LinearGradient(
                stops: [
                  Gradient.Stop(color: Color(red: 0.56, green: 0.67, blue: 0.16), location: 0.00),
                  Gradient.Stop(color: Color(red: 0.97, green: 1, blue: 0.33), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.82, y: 1.25),
                endPoint: UnitPoint(x: 0.82, y: -0.25)
              )
            )
            .cornerRadius(24)
            
            Spacer()
        }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.opacity(0.1))
        .onAppear {
            let descriptor = FetchDescriptor<User>(
                predicate: #Predicate { $0.id == userId }
            )
            do {
                let result = try context.fetch(descriptor)
                user = result.first
            } catch {
                print("사용자 조회 실패: \(error)")
            }
        }
    }
}

#Preview {
    EditCardModal(userId: UUID())
}
