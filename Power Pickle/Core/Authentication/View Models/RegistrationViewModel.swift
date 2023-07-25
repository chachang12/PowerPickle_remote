//
//  RegistrationViewModel.swift
//  Power Pickle
//
//  Created by Carson Chang on 7/5/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var fullname = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, fullname: fullname, username: username)
    }
}
