//
//  LoginView.swift
//  TalkPick
//
//  Created by rundo on 4/22/25.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    var body: some View {
        VStack {
            AppleSigninButton()
        }
        .frame(height:UIScreen.main.bounds.height)
        .background(Color.white)
    
    }
}

struct AppleSigninButton : View{
    var body: some View{
        
        VStack(spacing: 30) {
            Text("로그인")
                .font(.largeTitle)
            SignInWithAppleButtonView()
        }
    }
}

#Preview {
    LoginView()
}
