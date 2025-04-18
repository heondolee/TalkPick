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
            let descriptor = FetchDescriptor<Card>()
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

        try? context.save()
    }
}
