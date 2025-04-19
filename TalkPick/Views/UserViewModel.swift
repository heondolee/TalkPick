//
//  UserViewModel.swift
//  TalkPick
//
//  Created by rundo on 4/19/25.
//

import Foundation
import SwiftData

class UserViewModel: ObservableObject {
    @Published var foundUser: User?

    private var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    private func fetchUser(byName name: String) {
        let descriptor = FetchDescriptor<User>(
            predicate: #Predicate { $0.name == name }
        )

        do {
            let results = try context.fetch(descriptor)
            foundUser = results.first
        } catch {
            print("Error fetching user by name: \(error)")
            foundUser = nil
        }
    }
}
