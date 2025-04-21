//
//  EditCardModal.swift
//  TalkPick
//
//  Created by rundo on 4/19/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct EditCardSheet: View {
    
    @Environment(\.dismiss) private var dismiss  // 모달 닫기용
    @Environment(\.modelContext) private var context
    
    let cardId: UUID
    @State private var card: Card?

    @StateObject private var searchVM = SearchViewModel()
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    @State private var selectedTitle: String = "카테고리 선택"
    @State private var inputQuestion: String = ""
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil

    
    var categoryTitles: [String] {
        searchVM.topicSections.flatMap { $0.cards.map { $0.title } }
    }
    
    var body: some View {
    ScrollView {
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
                
                Text("질문 수정")
                  .font(
                    .headline
                    .bold()
                  )
                  .foregroundColor(.black)
                
                Spacer()

                
                Button {
                    if selectedTitle == "카테고리 선택" {
                        alertMessage = "카테고리를 입력하세요!"
                        showAlert = true
                        return
                    }
                    if inputQuestion == "" {
                        alertMessage = "질문을 입력하세요!"
                        showAlert = true
                        return
                    }

                    if let card = card {
                        card.question = inputQuestion
                        card.title = selectedTitle
                        card.image = selectedImageData
                        card.updatedAt = .now
                        try? context.save()
                        dismiss()
                    }
                } label: {
                    Text("수정")
                      .font(
                        .headline
                        .bold()
                      )
                      .foregroundColor(.red)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            
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
            
            VStack(alignment: .center) {
                Spacer()
                
                if let data = selectedImageData,
                   let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(16)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(12)
                        .frame(width: 80, height: 80)
                        .foregroundColor(.gray)
                        .background(Color.white)
                        .cornerRadius(16)
                }
                
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    Text("사진 선택")
                }
                .onChange(of: selectedItem) {
                    // selectedItem에 직접 접근
                    Task {
                        if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        }
                    }
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
                          )
                        Text("@\(card?.author?.name ?? "알 수 없음")")
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
    }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.keyboard) // 키보드를 눌러도 sheet 위의 뷰가 올라가지 않도록
        .alert(alertMessage, isPresented: $showAlert) {
            Button("확인", role: .cancel) {}
        }
        .onAppear {
            let descriptor = FetchDescriptor<Card>(
                predicate: #Predicate { $0.id == cardId }
            )
            do {
                let result = try context.fetch(descriptor)
                card = result.first
                if let card = card {
                    inputQuestion = card.question
                    selectedTitle = card.title
                    selectedImageData = card.image
                }
            } catch {
                print("카드 조회 실패: \(error)")
            }
        }
    }
}

#Preview {
    EditCardSheet(cardId: UUID())
}
