//
//  TalkPickApp.swift
//  TalkPick
//
//  Created by rundo on 4/13/25.
//

import SwiftUI
import SwiftData
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TalkPickApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authViewModel = AuthViewModel() // 🔥 전역 상태 공유

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel) // ✅ 여기에 주입
                .preferredColorScheme(.light)
        }
        .modelContainer(for: [User.self, Card.self])
    }
}

