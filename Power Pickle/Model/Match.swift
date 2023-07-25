//
//  Match.swift
//  Power Pickle
//
//  Created by Carson Chang on 6/29/23.
//

import Foundation

struct Match: Identifiable, Hashable, Codable {
    let id: String
    //let numPlayers: Int
    let user: String
    let teammate: String
    let opponent1: String
    let opponent2: String
    
    let team1score: Int
    let team2score: Int
    let winner: [String]
}

extension Match {
    static var MOCK_MATCHES: [Match] = [
        .init(id: NSUUID().uuidString,
              //numPlayers: 4,
              user: User.MOCK_USERS[0].id,
              teammate: User.MOCK_USERS[1].id,
              opponent1: User.MOCK_USERS[2].id,
              opponent2: User.MOCK_USERS[3].id,
              team1score: 11,
              team2score: 4,
              winner: [User.MOCK_USERS[0].id, User.MOCK_USERS[1].id]),
        .init(id: NSUUID().uuidString,
              //numPlayers: 4,
              user: User.MOCK_USERS[0].id,
              teammate: User.MOCK_USERS[1].id,
              opponent1: User.MOCK_USERS[3].id,
              opponent2: User.MOCK_USERS[4].id,
              team1score: 11,
              team2score: 4,
              winner: [User.MOCK_USERS[0].id, User.MOCK_USERS[1].id])
    ]
}
