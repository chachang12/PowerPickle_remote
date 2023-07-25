//
//  NewMatchViewModel.swift
//  Power Pickle
//
//  Created by Carson Chang on 7/8/23.
//

import Foundation

class NewMatchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
    
    
}
