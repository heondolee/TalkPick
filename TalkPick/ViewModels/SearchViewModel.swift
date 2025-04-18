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
                        Color(red: 1, green: 0.53, blue: 0.53),
                        Color(red: 1, green: 0.33, blue: 0.33)
                    ],
                    gradientStart: UnitPoint(x: 0.82, y: -0.25),
                    gradientEnd: UnitPoint(x: 0.82, y: 1.25)
                ),
                TopicCard(
                    title: "운동", icon: "⛹️‍♂️️",
                    gradientColors: [
                        Color(red: 0.45, green: 0.41, blue: 1),
                        Color(red: 0.81, green: 0.6, blue: 1)
                    ],
                    gradientStart: UnitPoint(x: 0.53, y: 1),
                    gradientEnd: UnitPoint(x: 0.53, y: 0)
                ),
                TopicCard(
                    title: "독서", icon: "📚",
                    gradientColors: [
                        Color(red: 0.2, green: 0.6, blue: 0.86),
                        Color(red: 0.2, green: 0.4, blue: 0.7)
                    ],
                    gradientStart: UnitPoint(x: 0.0, y: 0.0),
                    gradientEnd: UnitPoint(x: 1.0, y: 1.0)
                ),
                TopicCard(
                    title: "음악", icon: "🎵",
                    gradientColors: [
                        Color(red: 0.95, green: 0.8, blue: 0.3),
                        Color(red: 0.95, green: 0.6, blue: 0.2)
                    ],
                    gradientStart: UnitPoint(x: 0.2, y: 0.2),
                    gradientEnd: UnitPoint(x: 1.0, y: 1.0)
                )
            ]
        ),
        SectionModel(
            title: "분위기 · 상황",
            cards: [
                TopicCard(
                    title: "술자리", icon: "🍻",
                    gradientColors: [Color(red: 1.0, green: 0.5, blue: 0.3), Color(red: 0.9, green: 0.3, blue: 0.2)],
                    gradientStart: UnitPoint(x: 0.0, y: 0.0),
                    gradientEnd: UnitPoint(x: 1.0, y: 1.0)
                ),
                TopicCard(
                    title: "어색할 때", icon: "😬",
                    gradientColors: [Color(red: 0.3, green: 0.6, blue: 0.8), Color(red: 0.2, green: 0.4, blue: 0.6)],
                    gradientStart: UnitPoint(x: 0.5, y: 0.0),
                    gradientEnd: UnitPoint(x: 0.5, y: 1.0)
                ),
                TopicCard(
                    title: "레크레이션", icon: "🎯",
                    gradientColors: [Color(red: 0.4, green: 0.8, blue: 0.5), Color(red: 0.1, green: 0.6, blue: 0.3)],
                    gradientStart: UnitPoint(x: 1.0, y: 0.0),
                    gradientEnd: UnitPoint(x: 0.0, y: 1.0)
                ),
                TopicCard(
                    title: "딥토크", icon: "🧠",
                    gradientColors: [Color(red: 0.6, green: 0.6, blue: 0.8), Color(red: 0.2, green: 0.2, blue: 0.4)],
                    gradientStart: UnitPoint(x: 0.0, y: 1.0),
                    gradientEnd: UnitPoint(x: 1.0, y: 0.0)
                )
            ]
        ),
        SectionModel(
            title: "밸런스 게임",
            cards: [
                TopicCard(
                    title: "카드 A", icon: "🅰️",
                    gradientColors: [Color(red: 0.8, green: 0.4, blue: 0.6), Color(red: 0.6, green: 0.2, blue: 0.4)],
                    gradientStart: UnitPoint(x: 0.0, y: 0.5),
                    gradientEnd: UnitPoint(x: 1.0, y: 0.5)
                ),
                TopicCard(
                    title: "카드 B", icon: "🅱️",
                    gradientColors: [Color(red: 0.4, green: 0.6, blue: 0.9), Color(red: 0.2, green: 0.4, blue: 0.7)],
                    gradientStart: UnitPoint(x: 0.5, y: 0.0),
                    gradientEnd: UnitPoint(x: 0.5, y: 1.0)
                ),
                TopicCard(
                    title: "카드 C", icon: "🆚",
                    gradientColors: [Color(red: 0.9, green: 0.5, blue: 0.2), Color(red: 0.7, green: 0.3, blue: 0.1)],
                    gradientStart: UnitPoint(x: 0.0, y: 1.0),
                    gradientEnd: UnitPoint(x: 1.0, y: 0.0)
                ),
                TopicCard(
                    title: "카드 D", icon: "⚖️",
                    gradientColors: [Color(red: 0.3, green: 0.7, blue: 0.9), Color(red: 0.1, green: 0.5, blue: 0.7)],
                    gradientStart: UnitPoint(x: 1.0, y: 0.0),
                    gradientEnd: UnitPoint(x: 0.0, y: 1.0)
                )
            ]
        )
    ]
}
