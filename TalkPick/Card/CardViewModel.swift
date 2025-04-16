//
//  CardViewModel.swift
//  TalkPick
//
//  Created by rundo on 4/15/25.
//

import Foundation
import SwiftUI

struct DetailedCard: Identifiable, Hashable {
    let id = UUID()
    let author: String
    let question: String
    let title: String
    let likes: Int
    let dislikes: Int
    let image: String?
    let updatedAt: Date
}

class CardViewModel: ObservableObject {
    @Published var allCards: [DetailedCard] = []
    
    init() {
        allCards = detailedCards
    }
    func addCard(author: String, question: String, title: String, likes: Int, dislikes: Int, image: String?) {
        let newCard = DetailedCard(author: author, question: question, title: title, likes: likes, dislikes: dislikes, image: image, updatedAt: Date())
        allCards.append(newCard)
    }
    func removeCard(at index: Int) {
        guard index >= 0 && index < allCards.count else { return }
        allCards.remove(at: index)
    }
    func updateCard(at index: Int, with newCard: DetailedCard) {
        guard index >= 0 && index < allCards.count else { return }
        allCards[index] = newCard
    }
    func getCard(at index: Int) -> DetailedCard? {
        guard index >= 0 && index < allCards.count else { return nil }
        return allCards[index]
    }
    func getCardsByTitle(_ title: String) -> [DetailedCard] {
        return allCards.filter { $0.title == title }
    }
    func getCardsByAuthor(_ author: String) -> [DetailedCard] {
        return allCards.filter { $0.author == author }
    }
}
