//
//  IconCardView.swift
//  TalkPick
//
//  Created by rundo on 4/19/25.
//

import SwiftUI

struct IconCardView: View {
    var title: String
    var icon: String
    var gradientColors: [Color]
    var gradientStart: UnitPoint
    var gradientEnd: UnitPoint

    var body: some View {
        HStack(alignment: .bottom) {
            Text(title)
                .font(
                    .title3
                )
                .fontWeight(.black) // 또는 .heavy, .black
                .foregroundColor(.white)
            
            Spacer()
            
            VStack {
                Text(icon)
                    .font(
                        Font.custom("SF Pro", size: 56)
                            .weight(.heavy)
                    )
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100, alignment: .bottomLeading)
        .background(
            LinearGradient(
                gradient: Gradient(colors: gradientColors),
                startPoint: gradientStart,
                endPoint: gradientEnd
            )
        )
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
    }
}
