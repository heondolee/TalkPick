//
//  mockCardData.swift
//  TalkPick
//
//  Created by rundo on 4/18/25.
//

import Foundation

struct CardSample {
    var id: Int
    var question: String
    var title: String
    var likes: String
    var dislikes: String
    var image: String?
    var updatedAt: Date
}

let mockCardData: [CardSample] = [
    CardSample(id: 1, question: "여행 중 가장 기억에 남는 사건은?", title: "여행", likes: "0", dislikes: "0", image: "✈️", updatedAt: Date()),
    CardSample(id: 2, question: "가장 가고 싶은 여행지는 어디인가요?", title: "여행", likes: "0", dislikes: "0", image: "✈️", updatedAt: Date()),
    CardSample(id: 3, question: "여행 중 음식 때문에 당황한 적 있나요?", title: "여행", likes: "0", dislikes: "0", image: nil, updatedAt: Date()),

    CardSample(id: 4, question: "가장 즐겨 하는 운동은 무엇인가요?", title: "운동", likes: "0", dislikes: "0", image: "🏋️", updatedAt: Date()),
    CardSample(id: 5, question: "운동 중 가장 힘들었던 경험은?", title: "운동", likes: "0", dislikes: "0", image: "🏋️", updatedAt: Date()),
    CardSample(id: 6, question: "운동으로 생긴 재미있는 에피소드가 있나요?", title: "운동", likes: "0", dislikes: "0", image: nil, updatedAt: Date()),

    CardSample(id: 7, question: "가장 인상 깊게 읽은 책은 무엇인가요?", title: "독서", likes: "0", dislikes: "0", image: "📚", updatedAt: Date()),
    CardSample(id: 8, question: "책을 고를 때 가장 중요하게 보는 요소는?", title: "독서", likes: "0", dislikes: "0", image: "📚", updatedAt: Date()),
    CardSample(id: 9, question: "최근 읽은 책 중 추천하고 싶은 책은?", title: "독서", likes: "0", dislikes: "0", image: nil, updatedAt: Date()),

    CardSample(id: 10, question: "요즘 가장 자주 듣는 노래는?", title: "음악", likes: "0", dislikes: "0", image: "🎵", updatedAt: Date()),
    CardSample(id: 11, question: "인생 노래 한 곡을 꼽자면?", title: "음악", likes: "0", dislikes: "0", image: "🎵", updatedAt: Date()),
    CardSample(id: 12, question: "음악을 들으면 떠오르는 추억이 있나요?", title: "음악", likes: "0", dislikes: "0", image: nil, updatedAt: Date()),

    CardSample(id: 13, question: "가장 좋아하는 술안주는 무엇인가요?", title: "술자리", likes: "0", dislikes: "0", image: "🍻", updatedAt: Date()),
    CardSample(id: 14, question: "술자리에서 가장 창피했던 순간은?", title: "술자리", likes: "0", dislikes: "0", image: "🍻", updatedAt: Date()),
    CardSample(id: 15, question: "술 마시고 고백한 적 있나요?", title: "술자리", likes: "0", dislikes: "0", image: nil, updatedAt: Date()),

    CardSample(id: 16, question: "어색한 상황을 깨는 본인만의 방법은?", title: "어색할 때", likes: "0", dislikes: "0", image: "😅", updatedAt: Date()),
    CardSample(id: 17, question: "처음 만난 사람에게 먼저 하는 질문은?", title: "어색할 때", likes: "0", dislikes: "0", image: "😅", updatedAt: Date()),
    CardSample(id: 18, question: "처음 본 사람과 금방 친해지는 꿀팁은?", title: "어색할 때", likes: "0", dislikes: "0", image: nil, updatedAt: Date()),

    CardSample(id: 19, question: "가장 재밌었던 단체 게임은?", title: "레크레이션", likes: "0", dislikes: "0", image: "🎉", updatedAt: Date()),
    CardSample(id: 20, question: "분위기를 띄우는 본인만의 방법은?", title: "레크레이션", likes: "0", dislikes: "0", image: "🎉", updatedAt: Date()),
    CardSample(id: 21, question: "모임에서 가장 좋아하는 활동은?", title: "레크레이션", likes: "0", dislikes: "0", image: nil, updatedAt: Date()),

    CardSample(id: 22, question: "가장 최근에 울었던 이유는?", title: "딥토크", likes: "0", dislikes: "0", image: "💬", updatedAt: Date()),
    CardSample(id: 23, question: "지금 가장 두려운 것은?", title: "딥토크", likes: "0", dislikes: "0", image: "💬", updatedAt: Date()),
    CardSample(id: 24, question: "가장 기억에 남는 인생의 전환점은?", title: "딥토크", likes: "0", dislikes: "0", image: nil, updatedAt: Date()),

    CardSample(id: 25, question: "카레맛 똥 vs 똥맛 카레", title: "카드 A", likes: "0", dislikes: "0", image: "🃏", updatedAt: Date()),
    CardSample(id: 26, question: "평생 손톱 안 깎기 vs 발톱 안 깎기", title: "카드 A", likes: "0", dislikes: "0", image: "🃏", updatedAt: Date()),
    CardSample(id: 27, question: "1분 동안 공개 망신 vs 1년 동안 소문만 무성", title: "카드 A", likes: "0", dislikes: "0", image: nil, updatedAt: Date()),

    CardSample(id: 28, question: "시간을 멈추는 능력 vs 과거로 돌아가는 능력", title: "카드 B", likes: "0", dislikes: "0", image: "🃏", updatedAt: Date()),
    CardSample(id: 29, question: "항상 추위 vs 항상 더위", title: "카드 B", likes: "0", dislikes: "0", image: "🃏", updatedAt: Date()),
    CardSample(id: 30, question: "사람 앞에서 노래 부르기 vs 춤추기", title: "카드 B", likes: "0", dislikes: "0", image: nil, updatedAt: Date()),

    CardSample(id: 31, question: "항상 빨리 걷기 vs 항상 느리게 걷기", title: "카드 C", likes: "0", dislikes: "0", image: "🃏", updatedAt: Date()),
    CardSample(id: 32, question: "배고픈데 못 먹기 vs 졸린데 못 자기", title: "카드 C", likes: "0", dislikes: "0", image: "🃏", updatedAt: Date()),
    CardSample(id: 33, question: "하루 종일 노래 듣기 vs 하루 종일 침묵", title: "카드 C", likes: "0", dislikes: "0", image: nil, updatedAt: Date()),

    CardSample(id: 34, question: "100만원 즉시 받기 vs 10년 후 1억 받기", title: "카드 D", likes: "0", dislikes: "0", image: "🃏", updatedAt: Date()),
    CardSample(id: 35, question: "하루 동안 투명인간 vs 하루 동안 하늘을 날기", title: "카드 D", likes: "0", dislikes: "0", image: "🃏", updatedAt: Date()),
    CardSample(id: 36, question: "모든 걸 기억하기 vs 금방 잊기", title: "카드 D", likes: "0", dislikes: "0", image: "🃏", updatedAt: Date())
]
