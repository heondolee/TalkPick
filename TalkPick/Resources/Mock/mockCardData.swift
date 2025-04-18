//
//  mockCardData.swift
//  TalkPick
//
//  Created by rundo on 4/15/25.
import Foundation

let detailedCards: [DetailedCard] = [
    DetailedCard(author: "작성자 1", question: "여행 중 가장 기억에 남는 사건은?", title: "여행", likes: Int.random(in: 10...100), dislikes: 0, image: "✈️", updatedAt: Date()),
    DetailedCard(author: "작성자 2", question: "가장 가고 싶은 여행지는 어디인가요?", title: "여행", likes: Int.random(in: 10...100), dislikes: 0, image: "✈️", updatedAt: Date()),
    DetailedCard(author: "작성자 3", question: "여행 중 음식 때문에 당황한 적 있나요?", title: "여행", likes: Int.random(in: 10...100), dislikes: 0, image: "✈️", updatedAt: Date()),
    DetailedCard(author: "작성자 4", question: "여행 중 길을 잃은 경험이 있다면?", title: "여행", likes: Int.random(in: 10...100), dislikes: 0, image: "✈️", updatedAt: Date()),
    DetailedCard(author: "작성자 5", question: "혼자 여행 vs 친구들과 여행, 당신의 선택은?", title: "여행", likes: Int.random(in: 10...100), dislikes: 0, image: "✈️", updatedAt: Date()),

    DetailedCard(author: "작성자 1", question: "가장 즐겨 하는 운동은 무엇인가요?", title: "운동", likes: Int.random(in: 10...100), dislikes: 0, image: "🏋️", updatedAt: Date()),
    DetailedCard(author: "작성자 2", question: "운동 중 가장 힘들었던 경험은?", title: "운동", likes: Int.random(in: 10...100), dislikes: 0, image: "🏋️", updatedAt: Date()),
    DetailedCard(author: "작성자 3", question: "운동으로 생긴 재미있는 에피소드가 있나요?", title: "운동", likes: Int.random(in: 10...100), dislikes: 0, image: "🏋️", updatedAt: Date()),
    DetailedCard(author: "작성자 4", question: "운동할 때 듣는 추천 음악은?", title: "운동", likes: Int.random(in: 10...100), dislikes: 0, image: "🏋️", updatedAt: Date()),
    DetailedCard(author: "작성자 5", question: "운동을 꾸준히 하기 위한 팁이 있다면?", title: "운동", likes: Int.random(in: 10...100), dislikes: 0, image: "🏋️", updatedAt: Date()),

    DetailedCard(author: "작성자 1", question: "가장 인상 깊게 읽은 책은 무엇인가요?", title: "독서", likes: Int.random(in: 10...100), dislikes: 0, image: "📚", updatedAt: Date()),
    DetailedCard(author: "작성자 2", question: "책을 고를 때 가장 중요하게 보는 요소는?", title: "독서", likes: Int.random(in: 10...100), dislikes: 0, image: "📚", updatedAt: Date()),
    DetailedCard(author: "작성자 3", question: "최근 읽은 책 중 추천하고 싶은 책은?", title: "독서", likes: Int.random(in: 10...100), dislikes: 0, image: "📚", updatedAt: Date()),
    DetailedCard(author: "작성자 4", question: "전자책 vs 종이책, 당신의 선택은?", title: "독서", likes: Int.random(in: 10...100), dislikes: 0, image: "📚", updatedAt: Date()),
    DetailedCard(author: "작성자 5", question: "어릴 적 기억나는 동화책은?", title: "독서", likes: Int.random(in: 10...100), dislikes: 0, image: "📚", updatedAt: Date()),

    DetailedCard(author: "작성자 1", question: "요즘 가장 자주 듣는 노래는?", title: "음악", likes: Int.random(in: 10...100), dislikes: 0, image: "🎵", updatedAt: Date()),
    DetailedCard(author: "작성자 2", question: "인생 노래 한 곡을 꼽자면?", title: "음악", likes: Int.random(in: 10...100), dislikes: 0, image: "🎵", updatedAt: Date()),
    DetailedCard(author: "작성자 3", question: "음악을 들으면 떠오르는 추억이 있나요?", title: "음악", likes: Int.random(in: 10...100), dislikes: 0, image: "🎵", updatedAt: Date()),
    DetailedCard(author: "작성자 4", question: "노래방에서 꼭 부르는 애창곡은?", title: "음악", likes: Int.random(in: 10...100), dislikes: 0, image: "🎵", updatedAt: Date()),
    DetailedCard(author: "작성자 5", question: "콘서트에서 가장 기억에 남는 순간은?", title: "음악", likes: Int.random(in: 10...100), dislikes: 0, image: "🎵", updatedAt: Date()),

    DetailedCard(author: "작성자 1", question: "가장 좋아하는 술안주는 무엇인가요?", title: "술자리", likes: Int.random(in: 10...100), dislikes: 0, image: "🍻", updatedAt: Date()),
    DetailedCard(author: "작성자 2", question: "술자리에서 가장 창피했던 순간은?", title: "술자리", likes: Int.random(in: 10...100), dislikes: 0, image: "🍻", updatedAt: Date()),
    DetailedCard(author: "작성자 3", question: "술 마시고 고백한 적 있나요?", title: "술자리", likes: Int.random(in: 10...100), dislikes: 0, image: "🍻", updatedAt: Date()),
    DetailedCard(author: "작성자 4", question: "술자리에서 들은 최고의 말은?", title: "술자리", likes: Int.random(in: 10...100), dislikes: 0, image: "🍻", updatedAt: Date()),
    DetailedCard(author: "작성자 5", question: "술버릇이 있다면 어떤가요?", title: "술자리", likes: Int.random(in: 10...100), dislikes: 0, image: "🍻", updatedAt: Date()),

    DetailedCard(author: "작성자 1", question: "어색한 상황을 깨는 본인만의 방법은?", title: "어색할 때", likes: Int.random(in: 10...100), dislikes: 0, image: "😅", updatedAt: Date()),
    DetailedCard(author: "작성자 2", question: "처음 만난 사람에게 먼저 하는 질문은?", title: "어색할 때", likes: Int.random(in: 10...100), dislikes: 0, image: "😅", updatedAt: Date()),
    DetailedCard(author: "작성자 3", question: "처음 본 사람과 금방 친해지는 꿀팁은?", title: "어색할 때", likes: Int.random(in: 10...100), dislikes: 0, image: "😅", updatedAt: Date()),
    DetailedCard(author: "작성자 4", question: "어색했던 만남이 특별해진 경험이 있나요?", title: "어색할 때", likes: Int.random(in: 10...100), dislikes: 0, image: "😅", updatedAt: Date()),
    DetailedCard(author: "작성자 5", question: "어색할 때 절대 하지 말아야 할 행동은?", title: "어색할 때", likes: Int.random(in: 10...100), dislikes: 0, image: "😅", updatedAt: Date()),

    DetailedCard(author: "작성자 1", question: "가장 재밌었던 단체 게임은?", title: "레크레이션", likes: Int.random(in: 10...100), dislikes: 0, image: "🎉", updatedAt: Date()),
    DetailedCard(author: "작성자 2", question: "분위기를 띄우는 본인만의 방법은?", title: "레크레이션", likes: Int.random(in: 10...100), dislikes: 0, image: "🎉", updatedAt: Date()),
    DetailedCard(author: "작성자 3", question: "모임에서 가장 좋아하는 활동은?", title: "레크레이션", likes: Int.random(in: 10...100), dislikes: 0, image: "🎉", updatedAt: Date()),
    DetailedCard(author: "작성자 4", question: "단체 활동 중 기억에 남는 순간은?", title: "레크레이션", likes: Int.random(in: 10...100), dislikes: 0, image: "🎉", updatedAt: Date()),
    DetailedCard(author: "작성자 5", question: "웃음 빵 터진 게임 에피소드가 있나요?", title: "레크레이션", likes: Int.random(in: 10...100), dislikes: 0, image: "🎉", updatedAt: Date()),

    DetailedCard(author: "작성자 1", question: "가장 최근에 울었던 이유는?", title: "딥토크", likes: Int.random(in: 10...100), dislikes: 0, image: "💬", updatedAt: Date()),
    DetailedCard(author: "작성자 2", question: "지금 가장 두려운 것은?", title: "딥토크", likes: Int.random(in: 10...100), dislikes: 0, image: "💬", updatedAt: Date()),
    DetailedCard(author: "작성자 3", question: "가장 기억에 남는 인생의 전환점은?", title: "딥토크", likes: Int.random(in: 10...100), dislikes: 0, image: "💬", updatedAt: Date()),
    DetailedCard(author: "작성자 4", question: "죽기 전에 꼭 해보고 싶은 일은?", title: "딥토크", likes: Int.random(in: 10...100), dislikes: 0, image: "💬", updatedAt: Date()),
    DetailedCard(author: "작성자 5", question: "내가 진짜 원하는 삶은 어떤 모습일까?", title: "딥토크", likes: Int.random(in: 10...100), dislikes: 0, image: "💬", updatedAt: Date()),

    DetailedCard(author: "작성자 1", question: "카레맛 똥 vs 똥맛 카레", title: "카드 A", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),
    DetailedCard(author: "작성자 2", question: "평생 손톱 안 깎기 vs 발톱 안 깎기", title: "카드 A", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),
    DetailedCard(author: "작성자 3", question: "1분 동안 공개 망신 vs 1년 동안 소문만 무성", title: "카드 A", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),
    DetailedCard(author: "작성자 4", question: "눈물만 나는 감기 vs 재채기만 나오는 감기", title: "카드 A", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),
    DetailedCard(author: "작성자 5", question: "휴대폰 없이 1년 vs 인터넷 없이 1년", title: "카드 A", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),

    DetailedCard(author: "작성자 1", question: "시간을 멈추는 능력 vs 과거로 돌아가는 능력", title: "카드 B", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),
    DetailedCard(author: "작성자 2", question: "항상 추위 vs 항상 더위", title: "카드 B", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),
    DetailedCard(author: "작성자 3", question: "사람 앞에서 노래 부르기 vs 춤추기", title: "카드 B", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),
    DetailedCard(author: "작성자 4", question: "평생 라면만 먹기 vs 평생 치킨만 먹기", title: "카드 B", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),
    DetailedCard(author: "작성자 5", question: "모르는 사람과 1일 연애 vs 친구와 1일 연애", title: "카드 B", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),

    DetailedCard(author: "작성자 1", question: "항상 빨리 걷기 vs 항상 느리게 걷기", title: "카드 C", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),
    DetailedCard(author: "작성자 2", question: "배고픈데 못 먹기 vs 졸린데 못 자기", title: "카드 C", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),
    DetailedCard(author: "작성자 3", question: "하루 종일 노래 듣기 vs 하루 종일 침묵", title: "카드 C", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),
    DetailedCard(author: "작성자 4", question: "평생 고기 금지 vs 평생 디저트 금지", title: "카드 C", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),
    DetailedCard(author: "작성자 5", question: "초능력자 친구 갖기 vs 슈퍼히어로 되기", title: "카드 C", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),

    DetailedCard(author: "작성자 1", question: "100만원 즉시 받기 vs 10년 후 1억 받기", title: "카드 D", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),
    DetailedCard(author: "작성자 2", question: "하루 동안 투명인간 vs 하루 동안 하늘을 날기", title: "카드 D", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),
    DetailedCard(author: "작성자 3", question: "모든 걸 기억하기 vs 금방 잊기", title: "카드 D", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),
    DetailedCard(author: "작성자 4", question: "1년 내내 여름 vs 1년 내내 겨울", title: "카드 D", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date()),
    DetailedCard(author: "작성자 5", question: "친구 없이 유명인 vs 친구 많지만 무명", title: "카드 D", likes: Int.random(in: 10...100), dislikes: 0, image: "🃏", updatedAt: Date())
]
