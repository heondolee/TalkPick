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
        ZStack(alignment: .bottom) {
            // 배경 그라디언트
            LinearGradient(
                gradient: Gradient(colors: gradientColors),
                startPoint: gradientStart,
                endPoint: gradientEnd
            )

            // 반투명 하단 레이어
            Rectangle()
                .fill(Color.black.opacity(0.4))
                .frame(height: 40)
                .cornerRadius(12, corners: [.bottomLeft, .bottomRight])

            // 내용
            HStack(alignment: .bottom) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.black)
                    .foregroundColor(.white)

                Spacer()

                Text(icon)
                    .font(Font.custom("SF Pro", size: 56).weight(.heavy))
                    .foregroundColor(.white)
                    .offset(y: -8)
            }
            .padding(14)
        }
        .frame(height: 100)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
    }
}

import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
