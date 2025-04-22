//
//  AppleLogin.swift
//  TalkPick
//
//  Created by rundo on 4/22/25.
//

import SwiftUI
import AuthenticationServices
import FirebaseAuth
import CryptoKit

struct AppleSignInButton: View {
    @State private var currentNonce: String?

    var body: some View {
        SignInWithAppleButton(
            .signIn,
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
                    print("Authorization failed: \(error.localizedDescription)")
                }
            }
        )
        .signInWithAppleButtonStyle(.black)
        .frame(height: 50)
        .padding()
    }

    func handleAuthorization(_ authResults: ASAuthorization, nonce: String) {
        guard let credential = authResults.credential as? ASAuthorizationAppleIDCredential,
              let tokenData = credential.identityToken,
              let tokenString = String(data: tokenData, encoding: .utf8) else {
            print("Invalid credential")
            return
        }

        let firebaseCredential = OAuthProvider.credential(
            withProviderID: "apple.com",
            idToken: tokenString,
            rawNonce: nonce
        )

        Auth.auth().signIn(with: firebaseCredential) { (result, error) in
            if let error = error {
                print("Firebase error: \(error.localizedDescription)")
                return
            }
            print("Login success: \(String(describing: result?.user.uid))")
        }
    }
}

func sha256(_ input: String) -> String {
    let inputData = Data(input.utf8)
    let hashed = SHA256.hash(data: inputData)
    return hashed.compactMap { String(format: "%02x", $0) }.joined()
}

func randomNonceString(length: Int = 32) -> String {
    let charset: Array<Character> = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
    var result = ""
    var remainingLength = length

    while remainingLength > 0 {
        let randoms: [UInt8] = (0..<16).map { _ in
            var random: UInt8 = 0
            let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
            return errorCode == errSecSuccess ? random : UInt8.max
        }

        for random in randoms {
            if remainingLength == 0 { break }
            if random < charset.count {
                result.append(charset[Int(random)])
                remainingLength -= 1
            }
        }
    }

    return result
}
