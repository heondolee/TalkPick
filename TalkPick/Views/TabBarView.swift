//
//  TabBarView.swift
//  TalkPick
//
//  Created by rundo on 4/14/25.
//

import SwiftUI

struct TabBarView: View {

    var body: some View {
        VStack {
            TabView {
                // 둘러보기 탭
                SearchView()
                    .tabItem {
                        Image(systemName: "safari.fill")
                        Text("둘러보기")
                    }

                LikedView()
                    .tabItem {
                        Image(systemName: "hand.thumbsup") // 좋아요
                        Text("좋아요")
                    }

                MyHomeView()
                    .tabItem {
                        Image(systemName: "person") // 마이홈
                        Text("마이홈")
                    }
            }
            .accentColor(Color(red: 1, green: 0.27, blue: 0.27)) // 활성 탭 색상 설정
        }
    }
}

#Preview {
    TabBarView()
}
