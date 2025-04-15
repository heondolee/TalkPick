//
//  CardView.swift
//  TalkPick
//
//  Created by rundo on 4/15/25.
//

import SwiftUI

struct CardView: View {
    
    let topicTitle: String
    @State private var currentIndex = 0
    @StateObject var viewModel = CardViewModel()

    var filteredCards: [DetailedCard] {
        viewModel.getCardsByTitle(topicTitle)
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
                        VStack(alignment: .center, spacing: 0) {
                            Text("🎬")
                              .font(
                                Font.custom("SF Pro", size: 48)
                                  .weight(.bold)
                              )
                              .foregroundColor(.black)
                              .padding(.top, 24)
                            
                            HStack(alignment: .center, spacing: 8) {
                                Text(card.question)
                                  .font(
                                    Font.custom("SF Pro", size: 22)
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
                                HStack(alignment: .center) {
                                    
                                    Spacer()
                                    
                                    Text("@\(card.author)")
                                      .font(
                                        Font.custom("SF Pro", size: 13)
                                          .weight(.semibold)
                                      )
                                }

                            }
                            .padding(.leading, 5)
                            .padding(.trailing, 10)
                            .padding(.vertical, 6)
                            .padding(.leading, 5)
                            .fixedSize()
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.33))
                            .cornerRadius(16)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 64)
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
                            Font.custom("SF Pro", size: 30)
                              .weight(.medium)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 1, green: 0.27, blue: 0.27))
                          .frame(width: 104, height: 48, alignment: .center)
                        Text("좋아요\n\(filteredCards[currentIndex].likes)K")
                          .font(
                            Font.custom("SF Pro", size: 15)
                              .weight(.medium)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 1, green: 0.27, blue: 0.27))
                          .frame(width: 104, height: 48, alignment: .top)
                    }
                    .padding(0)
                    .frame(width: 104, height: 112, alignment: .top)
                    
                    VStack(alignment: .center, spacing: 10) {
                        Image(systemName: "hand.thumbsdown")
                          .font(
                            Font.custom("SF Pro", size: 30)
                              .weight(.medium)
                          )
                          .multilineTextAlignment(.center)
                          .frame(width: 104, height: 48, alignment: .center)
                        
                        Text("별로예요\n1K")
                          .font(
                            Font.custom("SF Pro", size: 15)
                              .weight(.medium)
                          )
                          .multilineTextAlignment(.center)
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
    }
}

#Preview {
    CardView(topicTitle: "여행")
}
