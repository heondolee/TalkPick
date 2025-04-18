//
//  CardViewModel.swift
//  TalkPick
//
//  Created by rundo on 4/18/25.
//

import SwiftUI
import SwiftData

class CardViewModel: ObservableObject {
    @Published var cards: [Card] = []
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
        loadCards()
    }
    
    func loadCards() {
        do {
            let descriptor = FetchDescriptor<Card>() // Card타입의 데이터를 모두 가져오겠다.
            cards = try context.fetch(descriptor)
            
            // 데이터 없으면 mock 삽입
            if cards.isEmpty {
                insertMockData()
                cards = try context.fetch(descriptor)
            }
        } catch {
            print("Error loading cards: \(error)")
        }
    }

    func getCardsByTitle(_ title: String) -> [Card] {
        return cards.filter { $0.title == title }
    }
    
    private func insertMockData() {
        let user = User(name: "임시작성자", imageData: nil)
        context.insert(user)

        for sample in mockCardData {
            let newCard = Card(
                author: user,
                question: sample.question,
                title: sample.title,
                likes: Int(sample.likes) ?? 0,
                dislikes: Int(sample.dislikes) ?? 0,
                image: sample.image,
                updatedAt: sample.updatedAt
            )
            context.insert(newCard)
        }

        try? context.save() // try? context.save()는 저장을 시도하고, 실패하더라도 앱이 멈추지 않게 합니다.
    }
}
