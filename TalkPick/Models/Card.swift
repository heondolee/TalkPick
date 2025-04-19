//
//  DetailedCard.swift
//  TalkPick
//
//  Created by rundo on 4/18/25.
//

import SwiftData
import Foundation
import SwiftUI

@Model // @Model은 SwiftData에서 해당 클래스가 데이터베이스 모델임을 지정해주는 매크로
class Card {
    var id: UUID
    var question: String
    var title: String
    var likes: Int
    var dislikes: Int
    var image: Data?  // UIImage를 Data로 변환해서 저장
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
        image: Data? = Data(),
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
