//
//  CardView.swift
//  TalkPick
//
//  Created by rundo on 4/15/25.
//

import SwiftUI

struct CardView: View {
    let topicTitle: String
    @Environment(\.modelContext) private var context
    @State private var viewModel: CardViewModel?

    init(topicTitle: String) {
        self.topicTitle = topicTitle
    }

    @State private var currentIndex = 0

    var filteredCards: [Card] {
        viewModel?.getCardsByTitle(topicTitle) ?? []
    }

    var body: some View {
        VStack(alignment: .center, spacing: 36) {
            Text(topicTitle)
                .font(.largeTitle)
                .bold()
            if !filteredCards.isEmpty {
                TabView(selection: $currentIndex) {
                    ForEach(0..<filteredCards.count, id: \.self) { index in
                        let card = filteredCards[index]
                        
                        //여기서 부터가 카드 UI
                        VStack(alignment: .center, spacing: 32) {
                            Spacer()
                            if let imageName = card.image {
                                Image(imageName)
                                    .resizable() // 크기 조절이 가능하게 한다.
                                    .scaledToFit() // 비율을 유지하며 크기를 키운다.
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            HStack(alignment: .center, spacing: 8) {
                                Text(card.question)
                                  .font(
                                    .title2
                                    .weight(.bold)
                                  )
                                  .kerning(0.38)
                                  .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.16))
                                  .frame(maxWidth: .infinity, alignment: .topLeading)
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 15)
                            .frame(maxWidth: .infinity, minHeight: 281, maxHeight: 281, alignment: .leading)
                            .background(.white.opacity(0.77))
                            .cornerRadius(10)
                            
                            
                            
                            HStack() {
                                Spacer()
                                
                                HStack(alignment: .center, spacing: 8) {
                                    Rectangle()
                                      .foregroundColor(.clear)
                                      .frame(maxWidth: .infinity, maxHeight: .infinity)
                                      .background(
                                        Image(systemName: "hand.thumbsup")
                                          .resizable()
                                          .aspectRatio(contentMode: .fill)
                                          .frame(width: 18, height: 18)
                                          .clipped()
                                      )
                                    Text("@\(card.author?.name ?? "알 수 없음")")
                                      .font(
                                        Font.custom("SF Pro", size: 13)
                                          .weight(.semibold)
                                      )

                                }
                                .padding(.leading, 5)
                                .padding(.trailing, 10)
                                .padding(.vertical, 6)
                                .padding(.leading, 5)
                                .fixedSize()
                                .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.33))
                                .cornerRadius(16)
                            }
                            .offset(x: 14) // 오른쪽으로 14만큼 이동 → 부모 패딩을 벗어남

                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 10)
                        .frame(width: 324, height: 483, alignment: .bottom)
                        .background(
                          LinearGradient(
                            stops: [
                              Gradient.Stop(color: Color(red: 0.56, green: 0.67, blue: 0.16), location: 0.00),
                              Gradient.Stop(color: Color(red: 0.97, green: 1, blue: 0.33), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.82, y: 1.25),
                            endPoint: UnitPoint(x: 0.82, y: -0.25)
                          )
                        )
                        .cornerRadius(24)
                        .tag(index)
                    }
                }
                .frame(height: 500) // 카드 높이보다 살짝 크게 지정
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack(alignment: .center, spacing: 64) {
                    VStack(alignment: .center, spacing: 10) {
                        Image(systemName: "hand.thumbsup")
                          .font(
                            Font.custom("SF Pro", size: 40)
                              .weight(.medium)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 1, green: 0.27, blue: 0.27))
                          .frame(width: 104, height: 48, alignment: .center)
                        Text("좋아요 \n \(filteredCards[currentIndex].likes)K")
                            .font(
                                .callout
                              .weight(.bold)
                            )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 1, green: 0.27, blue: 0.27))
                          .frame(width: 104, height: 100, alignment: .top)
                    }
                    .padding(0)
                    .frame(width: 104, height: 112, alignment: .top)
                    
                    VStack(alignment: .center, spacing: 10) {
                        Image(systemName: "hand.thumbsdown")
                          .font(
                            Font.custom("SF Pro", size: 40)
                              .weight(.medium)
                          )
                          .foregroundStyle(.secondary)
                          .multilineTextAlignment(.center)
                          .frame(width: 104, height: 48, alignment: .center)
                        
                        Text("별로예요\n1K")
                            .font(
                                .callout
                              .weight(.bold)
                            )
                          .multilineTextAlignment(.center)
                          .foregroundStyle(.secondary)
                          .frame(width: 104, height: 48, alignment: .top)
                    }
                    .padding(0)
                    .frame(width: 104, height: 112, alignment: .top)
                }
                .padding(0)
                .frame(width: 272, height: 112, alignment: .center)
            } else {
                Text("더 이상 카드가 없어요!")
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 0)
        .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            if viewModel == nil {
                viewModel = CardViewModel(context: context)
            }
        }
    }
}

#Preview {
    CardView(topicTitle: "음악")
}
