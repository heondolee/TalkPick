//
//  UploadTopicCards.swift
//  TalkPick
//
//  Created by rundo on 4/24/25.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class FirestoreUploader {
    static func uploadSection() {
        print("🔥 uploadSection() 실행 시작")

        let db = Firestore.firestore()
        
        print("db: ", db)

        let sectionData: [String: Any] = [
            "title": "인기 추천 주제",
            "cards": [
                [
                    "title": "여행",
                    "icon": "🛩️",
                    "gradientColors": [
                        ["r": 0.85, "g": 0.45, "b": 0.45],
                        ["r": 0.95, "g": 0.65, "b": 0.65]
                    ],
                    "gradientStart": ["x": 0.53, "y": 1],
                    "gradientEnd": ["x": 0.53, "y": 0]
                ],
                [
                    "title": "운동",
                    "icon": "⛹️‍♂️️",
                    "gradientColors": [
                        ["r": 0.65, "g": 0.6, "b": 0.95],
                        ["r": 0.85, "g": 0.75, "b": 0.95]
                    ],
                    "gradientStart": ["x": 0.53, "y": 1],
                    "gradientEnd": ["x": 0.53, "y": 0]
                ],
                [
                    "title": "독서",
                    "icon": "📚",
                    "gradientColors": [
                        ["r": 0.35, "g": 0.55, "b": 0.85],
                        ["r": 0.45, "g": 0.7, "b": 0.9]
                    ],
                    "gradientStart": ["x": 0.53, "y": 1],
                    "gradientEnd": ["x": 0.53, "y": 0]
                ],
                [
                    "title": "음악",
                    "icon": "🎵",
                    "gradientColors": [
                        ["r": 0.9, "g": 0.7, "b": 0.4],
                        ["r": 0.95, "g": 0.85, "b": 0.55]
                    ],
                    "gradientStart": ["x": 0.53, "y": 1],
                    "gradientEnd": ["x": 0.53, "y": 0]
                ]
            ]
        ]

//        print("0000")
//        Task {
//            print("1111")
//            try await db.collection("sections").document("popular_topics").setData(sectionData)
//            print("result")
//        }
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            db.collection("sections").document("popular_topics").setData(sectionData) { error in
                print("데이터 업로드중...")
                if let error = error {
                    print("❌ Firestore 업로드 실패: \(error.localizedDescription)")
                } else {
                    print("✅ Firestore에 업로드 성공!")
                }
            }
        }
    }
}
