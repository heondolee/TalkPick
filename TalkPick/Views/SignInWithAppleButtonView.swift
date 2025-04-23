//
//  SignInWithAppleButtonView.swift
//  TalkPick
//
//  Created by rundo on 4/22/25.
//

import SwiftUI
import AuthenticationServices
import FirebaseAuth
import CryptoKit
import SwiftData

struct SignInWithAppleButtonView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.modelContext) private var context
    @State private var viewModel: User?
    @State private var currentNonce: String?

    var body: some View {
        SignInWithAppleButton(.signIn,
                              onRequest: { request in
                                  let nonce = randomNonceString()
                                  currentNonce = nonce
                                  request.requestedScopes = [.email, .fullName]
                                  request.nonce = sha256(nonce)
                              },
                              onCompletion: { result in
                                  switch result {
                                  case .success(let authResults):
                                      if let nonce = currentNonce {
                                          handleAuthorization(authResults, nonce: nonce)
                                      }
                                  case .failure(let error):
                                      print("Apple login failed: \(error.localizedDescription)")
                                  }
                              })
        .signInWithAppleButtonStyle(.black)
        .frame(height: 50)
        .padding()
    }

    func handleAuthorization(_ auth: ASAuthorization, nonce: String) {
        guard let appleIDCredential = auth.credential as? ASAuthorizationAppleIDCredential,
              let tokenData = appleIDCredential.identityToken,
              let tokenString = String(data: tokenData, encoding: .utf8) else {
            print("Invalid Apple credential")
            return
        }

        let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                  idToken: tokenString,
                                                  rawNonce: nonce)

        Auth.auth().signIn(with: credential) { (result, error) in
            if let error = error {
                print("Firebase Auth failed: \(error.localizedDescription)")
                return
            }

            guard let user = result?.user else { return }
            let userID = user.uid

            Task {
                let container = try? ModelContainer(for: User.self)
                guard let context = container?.mainContext else { return }

                guard let userUUID = UUID(uuidString: userID) else { return }

                let fetchDescriptor = FetchDescriptor<User>(
                    predicate: #Predicate { $0.id == userUUID }
                )

                var userModel = try? context.fetch(fetchDescriptor).first

                if userModel == nil {
                    let newUser = User(id: userUUID,
                                       name: user.displayName ?? "이름을 편집하세요",
                                       imageData: nil)
                    context.insert(newUser)
                    try? context.save()
                    print("🟢 New user created: \(newUser.name), ID: \(newUser.id)")
                    userModel = newUser
                }

                DispatchQueue.main.async {
                    authViewModel.userID = userModel?.id.uuidString
                    authViewModel.isLoggedIn = true
                    print("✅ Login successful. UserID: \(authViewModel.userID ?? "nil"), isLoggedIn: \(authViewModel.isLoggedIn)")
                }
            }
        }
    }
}
