//
//  AuthViewModel.swift
//  TalkPick
//
//  Created by rundo on 4/22/25.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var userID: String?

    init() {
        if let currentUser = Auth.auth().currentUser {
            self.userID = currentUser.uid
            self.isLoggedIn = true
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.isLoggedIn = false
            self.userID = nil
        } catch {
            print("Sign out error: \(error.localizedDescription)")
        }
    }
}


