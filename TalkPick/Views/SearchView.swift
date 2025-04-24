//
//  SearchView.swift
//  TalkPick
//
//  Created by rundo on 4/14/25.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
//    @EnvironmentObject var authViewModel: AuthViewModel // 카드 좋아요 누를때
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(viewModel.topicSections) { section in
                            Text(section.title)
                                .font(.title2)
                                .fontWeight(.black)
                                .padding(.horizontal, 16)
                                .padding(.top, 16)

                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(section.cards, id: \.self) { card in
                                    NavigationLink(destination: CardView(topicTitle: card.title)) {
                                        IconCardView(
                                            title: card.title,
                                            icon: card.icon,
                                            gradientColors: card.gradientColors,
                                            gradientStart: card.gradientStart,
                                            gradientEnd: card.gradientEnd
                                        )
                                    }
                                    
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.top, 8)
                        }
                    }
                }
            }
            .navigationTitle("둘러보기")
        }
    }
}

#Preview {
    SearchView()
}
