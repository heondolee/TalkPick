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
        SignInWithAppleButton(
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result {
                case .success(let authResults):
                    print("Apple Login Successful")
                    switch authResults.credential{
                        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                           // 계정 정보 가져오기
                            let IdentityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
                            print("IdentityToken: ", IdentityToken ?? "")
                            let AuthorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
                            print("AuthorizationCode: ", AuthorizationCode ?? "")
                            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                               let window = windowScene.windows.first {
                                window.rootViewController = UIHostingController(
                                    rootView: TabBarView()
                                        .preferredColorScheme(.light)
                                        .modelContainer(for: [User.self, Card.self])
                                )
                                window.makeKeyAndVisible()
                            }
                    default:
                        break
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print("error")
                }
            }
        )
        .frame(width : UIScreen.main.bounds.width * 0.9, height:50)
        .cornerRadius(5)
    }
}

#Preview {
    LoginView()
}
