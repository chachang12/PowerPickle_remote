//
//  LoginViewModel.swift
//  Power Pickle
//
//  Created by Carson Chang on 7/5/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
    
}
