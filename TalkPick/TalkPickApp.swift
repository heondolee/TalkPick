//
//  TalkPickApp.swift
//  TalkPick
//
//  Created by rundo on 4/13/25.
//

import SwiftUI
import SwiftData
import FirebaseCore

@main
struct TalkPickApp: App {
    @StateObject var authViewModel = AuthViewModel() // 🔥 전역 상태 공유
    
    init() {
        FirebaseApp.configure()
        FirestoreUploader.uploadSection() // 한번만 실행
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
                .preferredColorScheme(.light)
        }
        .modelContainer(for: [User.self, Card.self])
    }
}

