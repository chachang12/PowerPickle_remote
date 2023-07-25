//
//  SearchViewModel.swift
//  Power Pickle
//
//  Created by Carson Chang on 7/6/23.
//

import Foundation

class searchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
