//
//  User.swift
//  Power Pickle
//
//  Created by Carson Chang on 6/28/23.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    let email: String
    var wins: Int?
    var matchesPlayed: Int?
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
    
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "kimch", profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/power-pickle.appspot.com/o/profile_images%2F972CDA00-6BC7-42B9-82B5-6A9374BB1B93?alt=media&token=cdb40a72-f57f-417b-8415-8487def2a4d0", fullname: "Kim Chaewon", email: "test@email.com", wins: 2, matchesPlayed: 3),
        .init(id: NSUUID().uuidString, username: "hunjin", profileImageUrl: nil, fullname: "Huh Yunjin", email: "jennifer@email.com", wins: 4, matchesPlayed: 5),
        .init(id: NSUUID().uuidString, username: "kaz", profileImageUrl: nil, fullname: "Kazhua", email: "kaz@email.com", wins: 1, matchesPlayed: 3),
        .init(id: NSUUID().uuidString, username: "eun", profileImageUrl: nil, fullname: "Kim Eunchae", email: "eun@email.com", wins: 4, matchesPlayed: 6),
        .init(id: NSUUID().uuidString, username: "rose", profileImageUrl: nil, fullname: "Park Chaeyoung", email: "rose@email.com", wins: 5, matchesPlayed: 10),
        .init(id: NSUUID().uuidString, username: "yujinan", profileImageUrl: nil, fullname: "An Yujin", email: "yuj@email.com", wins: 1, matchesPlayed: 2)
    ]
}
