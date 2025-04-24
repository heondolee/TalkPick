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
        VStack(alignment: .center) {
            
            AppleSigninButton()
        }
        .frame(height:UIScreen.main.bounds.height)
        .background(Color.white)
    
    }
}

struct AppleSigninButton : View{
    var body: some View{
        
        VStack(spacing: 50) {
            
            Text("Talk Pick")
                .font(.system(size: 48, weight: .bold))
                .padding(.horizontal, 16)
                .padding(.top, 16)
            
            SignInWithAppleButtonView()
        }
    }
}

#Preview {
    LoginView()
}
