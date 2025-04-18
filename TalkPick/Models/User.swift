//
//  User.swift
//  TalkPick
//
//  Created by rundo on 4/18/25.
//

import SwiftData
import Foundation

@Model
class User {
    @Attribute(.unique) var id: UUID // @Attribute(.unique)는 SwiftData가 id를 중복 없이 관리하도록 함.
    var name: String
    var imageData: Data?
    
    @Relationship(deleteRule: .cascade) // @Relationship을 통해 User가 소유한 DetailedCard 목록을 정의, deleteRule: .cascade: 유저 삭제 시 카드도 같이 삭제됨.
    var cards: [Card]?


    init(id: UUID = UUID(), name: String, imageData: Data?) {
        self.id = id
        self.name = name
        self.imageData = imageData
    }
}
