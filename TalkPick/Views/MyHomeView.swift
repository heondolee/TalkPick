//
//  MyHomeView.swift
//  TalkPick
//
//  Created by rundo on 4/14/25.
//

import SwiftUI
import SwiftData

struct MyHomeView: View {
    
    @Environment(\.modelContext) private var context
    @State private var viewModel: CardViewModel?
    @State private var viewModel2: User?
    @Query private var allCards: [Card]
    
    var userCards: [Card] {
        guard let userId = viewModel2?.id else { return [] }
        return allCards.filter { $0.author?.id == userId }
    }
    
    @State private var showModal = false
    @State private var showModal2 = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 24) { // 전체 세로 프레임
                HStack(alignment: .bottom, spacing: 18) { // 프로필 세로 프레임
                    VStack(alignment: .center, spacing: 10) {
                        if let user = viewModel2, // 이런식으로 실제 값이 있는지검사
                           let data = user.imageData,
                           let uiImage = UIImage(data: data) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color(.systemGray4))
                        }
                        
                    }
                    .padding(0)
                    .frame(width: 86, height: 86, alignment: .center)
                    .cornerRadius(10000)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("@\(viewModel2?.name ?? "NoGuest")")
                            .font(
                            .title2
                                .weight(.semibold)
                        )
                        HStack(alignment: .center, spacing: 2) { // 프로필 편집 버튼
                            Button {
                                showModal2 = true
                            } label: {
                                Text("프로필 편집")
                                    .font(
                                        .headline
                                    )
                                    .foregroundColor(.black)
                            }
                            .sheet(isPresented: $showModal2) {
                                if let user = viewModel2 {
                                    EditProfileSheet(userId: user.id)
                                } else {
                                    Text("사용자 정보를 불러올 수 없습니다.")
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(60)
                    }
                }
                .padding(.top, 16)
                .padding(.horizontal, 24)
                
                VStack() { // 내가 쓴 질문 + 질문 리스트
                    HStack(alignment: .center, spacing: 0) { // 내가 쓴 질문 가로 프레임 + 버튼
                        Text("내가 쓴 질문")
                            .font(
                                .title2
                                    .weight(.bold)
                            )
                        
                        Spacer()
                        
                        Button { // 질문 추가 버튼
                            showModal = true
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                        }
                        .sheet(isPresented: $showModal) {
                            if let user = viewModel2 {
                                EditCardSheet(userId: user.id)
                            } else {
                                Text("사용자 정보를 불러올 수 없습니다.")
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    VStack {
                        
                        // 프리뷰용 코드
                        List {
                            NavigationLink {
                                Text("카드 상세 또는 수정 화면") // 필요 시 교체
                            } label: {
                                HStack(alignment: .top, spacing: 12) {
                                    
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(12)
                                        .frame(width: 60, height: 60)
                                        .foregroundColor(.gray)
                                        .background(Color.black)
                                        .cornerRadius(5)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("안녕하세요~~~!!")
                                            .font(.headline)
                                        
                                        Spacer()
                                        
                                        HStack(alignment: .center){
                                            
                                            Image(systemName: "hand.thumbsup")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .foregroundColor(Color(red: 1, green: 0.27, blue: 0.27))
                                                .frame(width: 18, height: 18)
                                            Text("123")
                                                .font(.caption)
                                                .foregroundColor(Color(red: 1, green: 0.27, blue: 0.27))
                                            
                                            Spacer()
                                            
                                            Text("운동")
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                            Text("@Rundo")
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                        }
                                        .padding(.trailing, 12)
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .padding(.vertical, 12)
                            }
                            
                            NavigationLink {
                                Text("카드 상세 또는 수정 화면") // 필요 시 교체
                            } label: {
                                HStack(alignment: .top, spacing: 12) {
                                    
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(12)
                                        .frame(width: 60, height: 60)
                                        .foregroundColor(.gray)
                                        .background(Color.black)
                                        .cornerRadius(5)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("안녕하세요~~~!!")
                                            .font(.headline)
                                        
                                        Spacer()
                                        
                                        HStack(alignment: .center){
                                            
                                            Image(systemName: "hand.thumbsup")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .foregroundColor(Color(red: 1, green: 0.27, blue: 0.27))
                                                .frame(width: 18, height: 18)
                                            Text("123")
                                                .font(.caption)
                                                .foregroundColor(Color(red: 1, green: 0.27, blue: 0.27))
                                            
                                            Spacer()
                                            
                                            Text("운동")
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                            Text("@Rundo")
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                        }
                                        .padding(.trailing, 12)
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .padding(.vertical, 12)
                            }
                        }
                        .listStyle(.inset)
                        
                        
                        
                        // 여기는 실제 코드
//                        List {
//                            ForEach(userCards, id: \.id) { card in
//                                NavigationLink {
//                                    Text("카드 상세 또는 수정 화면") // 필요 시 교체
//                                } label: {
//                                    HStack(alignment: .top, spacing: 12) {
//                                        if let imageData = card.image, let uiImage = UIImage(data: imageData) {
//                                            Image(uiImage: uiImage)
//                                                .resizable()
//                                                .aspectRatio(contentMode: .fill)
//                                                .frame(width: 40, height: 40)
//                                                .clipShape(Circle())
//                                        } else {
//                                            Circle()
//                                                .fill(Color.gray.opacity(0.3))
//                                                .frame(width: 40, height: 40)
//                                        }
//
//                                        VStack(alignment: .leading, spacing: 4) {
//                                            Text(card.question)
//                                                .font(.headline)
//                                            Text(card.title)
//                                                .font(.subheadline)
//                                                .foregroundColor(.gray)
//                                            if let authorName = card.author?.name {
//                                                Text("@\(authorName)")
//                                                    .font(.caption)
//                                                    .foregroundColor(.secondary)
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("마이홈")
            .task {
                let descriptor = FetchDescriptor<User>()
                if let users = try? context.fetch(descriptor), users.count == 1 {
                    let tempUser = User(name: "Guest", imageData: Data())
                    context.insert(tempUser)
                    try? context.save()
                    viewModel2 = tempUser
                } else {
                    do {
                        let users = try context.fetch(descriptor)
                        if users.indices.contains(1) {
                            viewModel2 = users[1]
                        } else {
                            viewModel2 = users.first
                        }
                    } catch {
                        print("유저 fetch 실패: \(error)")
                        viewModel2 = nil
                    }
                }
            }
        }
    }
}

#Preview {
    MyHomeView()
}
