//
//  CardViewModel.swift
//  TalkPick
//
//  Created by rundo on 4/15/25.
//

import SwiftData
import Foundation

@Model
class User {
    @Attribute(.unique) var id: UUID // @Attribute(.unique)는 SwiftData가 id를 중복 없이 관리하도록 함.
    var name: String
    var imageData: Data?
    
    @Relationship(deleteRule: .cascade) // @Relationship을 통해 User가 소유한 DetailedCard 목록을 정의, deleteRule: .cascade: 유저 삭제 시 카드도 같이 삭제됨.
    var cards: [DetailedCard]?


    init(id: UUID = UUID(), name: String, email: String) {
        self.id = id
        self.name = name
        self.imageData = nil
    }
}

@Model // @Model은 SwiftData에서 해당 클래스가 데이터베이스 모델임을 지정해주는 매크로
class DetailedCard {
    var id: UUID
    var question: String
    var title: String
    var likes: Int
    var dislikes: Int
    var image: String?
    var updatedAt: Date

    @Relationship(inverse: \User.cards) // 이 관계의 반대편은 User 모델 안의 cards 프로퍼티라는 뜻
    var author: User?

    init(
        id: UUID = UUID(),
        author: User?,
        question: String,
        title: String,
        likes: Int = 0,
        dislikes: Int = 0,
        image: String? = nil,
        updatedAt: Date = .now
    ) {
        self.id = id
        self.author = author
        self.question = question
        self.title = title
        self.likes = likes
        self.dislikes = dislikes
        self.image = image
        self.updatedAt = updatedAt
    }
}
