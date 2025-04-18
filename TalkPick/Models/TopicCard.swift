//
//  TopicCard.swift
//  TalkPick
//
//  Created by rundo on 4/18/25.
//
import Foundation
import SwiftUI

struct TopicCard: Hashable {
    let title: String
    let icon: String
    let gradientColors: [Color]
    let gradientStart: UnitPoint
    let gradientEnd: UnitPoint
}

struct SectionModel: Identifiable {
    let id = UUID()
    let title: String
    let cards: [TopicCard]
}
