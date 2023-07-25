//
//  UserService.swift
//  Power Pickle
//
//  Created by Carson Chang on 7/6/23.
//

import Foundation
import Firebase

struct UserService {
    
    @MainActor
    static func fetchAllUsers() async throws -> [User] {
        var users = [User]()
        
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self)})
    }
    
}
