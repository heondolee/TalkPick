//
//  TalkPickApp.swift
//  TalkPick
//
//  Created by rundo on 4/13/25.
//

import SwiftUI
import SwiftData

@main
struct TalkPickApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light) // 👉 라이트 모드 고정
        }
        .modelContainer(for: [User.self, DetailedCard.self]) // SwiftUI 앱에서는 @main struct에서 .modelContainer(for:)를 사용해 모델을 연결해야 합니다.
        // 이걸 해줘야 SwiftUI 환경에 @Query, @Environment(\.modelContext) 같은 기능이 작동합니다.
    }
}
