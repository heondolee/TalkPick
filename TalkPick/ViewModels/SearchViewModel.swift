//
//  SearchViewModel.swift
//  TalkPick
//
//  Created by rundo on 4/15/25.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var topicSections: [SectionModel] = [
        SectionModel(
            title: "인기 추천 주제",
            cards: [
                TopicCard(
                    title: "여행", icon: "🛩️",
                    gradientColors: [
                        Color(red: 0.85, green: 0.45, blue: 0.45),
                        Color(red: 0.95, green: 0.65, blue: 0.65)
                    ],
                    gradientStart: UnitPoint(x: 0.53, y: 1),
                    gradientEnd: UnitPoint(x: 0.53, y: 0)
                ),
                TopicCard(
                    title: "운동", icon: "⛹️‍♂️️",
                    gradientColors: [
                        Color(red: 0.65, green: 0.6, blue: 0.95),
                        Color(red: 0.85, green: 0.75, blue: 0.95)
                    ],
                    gradientStart: UnitPoint(x: 0.53, y: 1),
                    gradientEnd: UnitPoint(x: 0.53, y: 0)
                ),
                TopicCard(
                    title: "독서", icon: "📚",
                    gradientColors: [
                        Color(red: 0.35, green: 0.55, blue: 0.85),
                        Color(red: 0.45, green: 0.7, blue: 0.9)
                    ],
                    gradientStart: UnitPoint(x: 0.53, y: 1),
                    gradientEnd: UnitPoint(x: 0.53, y: 0)
                ),
                TopicCard(
                    title: "음악", icon: "🎵",
                    gradientColors: [
                        Color(red: 0.9, green: 0.7, blue: 0.4),
                        Color(red: 0.95, green: 0.85, blue: 0.55)
                    ],
                    gradientStart: UnitPoint(x: 0.53, y: 1),
                    gradientEnd: UnitPoint(x: 0.53, y: 0)
                )
            ]
        ),
        SectionModel(
            title: "분위기 · 상황",
            cards: [
                TopicCard(
                    title: "술자리", icon: "🍻",
                    gradientColors: [
                        Color(red: 0.95, green: 0.55, blue: 0.35),
                        Color(red: 0.95, green: 0.7, blue: 0.55)
                    ],
                    gradientStart: UnitPoint(x: 0.53, y: 1),
                    gradientEnd: UnitPoint(x: 0.53, y: 0)
                ),
                TopicCard(
                    title: "어색할 때", icon: "😬",
                    gradientColors: [
                        Color(red: 0.35, green: 0.55, blue: 0.75),
                        Color(red: 0.45, green: 0.7, blue: 0.85)
                    ],
                    gradientStart: UnitPoint(x: 0.53, y: 1),
                    gradientEnd: UnitPoint(x: 0.53, y: 0)
                ),
                TopicCard(
                    title: "이벤트", icon: "🎯",
                    gradientColors: [
                        Color(red: 0.25, green: 0.7, blue: 0.45),
                        Color(red: 0.45, green: 0.9, blue: 0.6)
                    ],
                    gradientStart: UnitPoint(x: 0.53, y: 1),
                    gradientEnd: UnitPoint(x: 0.53, y: 0)
                ),
                TopicCard(
                    title: "딥토크", icon: "🧠",
                    gradientColors: [
                        Color(red: 0.45, green: 0.45, blue: 0.6),
                        Color(red: 0.6, green: 0.65, blue: 0.85)
                    ],
                    gradientStart: UnitPoint(x: 0.53, y: 1),
                    gradientEnd: UnitPoint(x: 0.53, y: 0)
                )
            ]
        ),
        SectionModel(
            title: "밸런스 게임",
            cards: [
                TopicCard(
                    title: "카드 A", icon: "🅰️",
                    gradientColors: [
                        Color(red: 0.75, green: 0.45, blue: 0.6),
                        Color(red: 0.8, green: 0.6, blue: 0.75)
                    ],
                    gradientStart: UnitPoint(x: 0.53, y: 1),
                    gradientEnd: UnitPoint(x: 0.53, y: 0)
                ),
                TopicCard(
                    title: "카드 B", icon: "🅱️",
                    gradientColors: [
                        Color(red: 0.35, green: 0.55, blue: 0.85),
                        Color(red: 0.55, green: 0.75, blue: 0.95)
                    ],
                    gradientStart: UnitPoint(x: 0.53, y: 1),
                    gradientEnd: UnitPoint(x: 0.53, y: 0)
                ),
                TopicCard(
                    title: "카드 C", icon: "🆚",
                    gradientColors: [
                        Color(red: 0.8, green: 0.55, blue: 0.25),
                        Color(red: 0.9, green: 0.6, blue: 0.35)
                    ],
                    gradientStart: UnitPoint(x: 0.53, y: 1),
                    gradientEnd: UnitPoint(x: 0.53, y: 0)
                ),
                TopicCard(
                    title: "카드 D", icon: "⚖️",
                    gradientColors: [
                        Color(red: 0.25, green: 0.6, blue: 0.85),
                        Color(red: 0.45, green: 0.8, blue: 0.95)
                    ],
                    gradientStart: UnitPoint(x: 0.53, y: 1),
                    gradientEnd: UnitPoint(x: 0.53, y: 0)
                )
            ]
        )
    ]
}
