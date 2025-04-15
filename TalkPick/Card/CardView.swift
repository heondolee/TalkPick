//
//  CardView.swift
//  TalkPick
//
//  Created by rundo on 4/15/25.
//

import SwiftUI

struct CardView: View {
    
    let topicTitle: String
    @State private var currentIndex = 0
    @StateObject var viewModel = CardViewModel()

    var filteredCards: [DetailedCard] {
        viewModel.getCardsByTitle(topicTitle)
    }

    var body: some View {
        VStack {
            Text(topicTitle)
                .font(.largeTitle)
                .bold()
                .padding(.top, 20)

            if currentIndex < filteredCards.count {
                let card = filteredCards[currentIndex]
                VStack(spacing: 16) {
                    Text(card.question)
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)

                    Text("@\(card.author)")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    HStack(spacing: 32) {
                        Button("👍 좋아요 \(card.likes)") {
                            // 좋아요 처리
                            currentIndex += 1
                        }

                        Button("👎 별로예요") {
                            // 넘기기
                            currentIndex += 1
                        }
                    }
                }
                .padding()
                .background(Color.green.opacity(0.3))
                .cornerRadius(20)
                .padding()
            } else {
                Text("더 이상 카드가 없어요!")
            }
        }
    }
}

#Preview {
    CardView(topicTitle: "여행")
}
