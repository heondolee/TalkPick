//
//  SearchView.swift
//  TalkPick
//
//  Created by rundo on 4/14/25.
//

import SwiftUI
// 🃏 카테고리 카드
struct IconCardView: View {
    var title: String
    var icon: String
    var gradientColors: [Color]
    var gradientStart: UnitPoint
    var gradientEnd: UnitPoint

    var body: some View {
        HStack(alignment: .bottom) {
            Text(title)
                .font(
                    .title3
                )
                .fontWeight(.black) // 또는 .heavy, .black
                .foregroundColor(.white)
            
            Spacer()
            
            VStack {
                Text(icon)
                    .font(
                        Font.custom("SF Pro", size: 56)
                            .weight(.heavy)
                    )
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100, alignment: .bottomLeading)
        .background(
            LinearGradient(
                gradient: Gradient(colors: gradientColors),
                startPoint: gradientStart,
                endPoint: gradientEnd
            )
        )
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
    }
}

let columns = [
    GridItem(.flexible(), spacing: 16),
    GridItem(.flexible())
]

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()

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
            .navigationTitle("Talk Pick")
        }
    }
}

#Preview {
    SearchView()
}
