//
//  LikedView.swift
//  TalkPick
//
//  Created by rundo on 4/14/25.
//

import SwiftUI
import SwiftData

struct LikedView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @Environment(\.modelContext) private var context

    @State private var viewModel: CardViewModel?
    @State private var viewModel2: User?
    @Query private var allUsers: [User]
    
    var likedCards: [Card] {
        guard let userId = viewModel2?.id else { return [] }
        return allUsers.first(where: { $0.id == userId })?.likedCards.sorted(by: { $0.updatedAt > $1.updatedAt }) ?? []
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 24) {
                if likedCards.isEmpty {
                    VStack {
                        Spacer()
                        Text("아직 좋아요한 카드가 없어요")
                            .font(.title3)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                } else {
                    List {
                        ForEach(likedCards, id: \.id) { card in
                            NavigationLink {
                                CardView(card: card)
                            } label: {
                                HStack(alignment: .center, spacing: 12) {
                                    if let imageData = card.image, let uiImage = UIImage(data: imageData) {
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 60, height: 60)
                                            .cornerRadius(5)
                                    } else {
                                        Image(systemName: "photo")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding(12)
                                            .frame(width: 60, height: 60)
                                            .foregroundColor(.gray)
                                            .background(Color(.systemGray6))
                                            .cornerRadius(5)
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(card.question)
                                            .font(.headline)
                                        Spacer()
                                        HStack(alignment: .center){
                                            Image(systemName: "hand.thumbsup")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .foregroundColor(.gray)
                                                .frame(width: 18, height: 18)
                                            
                                            Text("\(card.likes)")
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                            
                                            Text(card.title)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                            
                                            Spacer()
                                            
                                            if let data = card.author?.imageData,
                                               let uiImage = UIImage(data: data) {
                                                Image(uiImage: uiImage)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 18, height: 18)
                                                    .clipShape(Circle())
                                            } else {
                                                Image(systemName: "person.crop.circle.fill")
                                                    .resizable()
                                                    .frame(width: 18, height: 18)
                                                    .foregroundColor(Color(.systemGray4))
                                            }
                                            
                                            if let authorName = card.author?.name {
                                                Text("@\(authorName)")
                                                    .font(.caption)
                                                    .foregroundColor(.secondary)
                                            }
                                        }
                                        .padding(.trailing, 12)
                                    }
                                    .frame(height: 21)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .padding(.vertical, 12)
                            }
                        }
                    }
                    .listStyle(.inset)
                }
            }
            .navigationTitle("좋아요")
            .task {
                do {
                    guard let userID = authViewModel.userID else {
                        print("Invalid user ID")
                        return
                    }

                    let descriptor = FetchDescriptor<User>(
                        predicate: #Predicate { $0.id == userID }
                    )

                    viewModel2 = try context.fetch(descriptor).first
                    
                    let name = viewModel2?.name
                    print("name: \(name ?? "nil")")
                } catch {
                    print("유저 fetch 실패: \(error)")
                    viewModel2 = nil
                }
            }
        }
    }
}

#Preview {
    LikedView()
}
