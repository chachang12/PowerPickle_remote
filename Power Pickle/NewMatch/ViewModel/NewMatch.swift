//
//  NewMatch.swift
//  Power Pickle
//
//  Created by Carson Chang on 7/12/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class NewMatch: ObservableObject {
    
    static func uploadMatchData(id: String, user: String, teammate: String, opponent1: String, opponent2: String, team1score: Int, team2score: Int, winner: [String]) async {
        let match = Match(id: NSUUID().uuidString, user: user, teammate: teammate, opponent1: opponent1, opponent2: opponent2, team1score: team1score, team2score: team2score, winner: winner)
        //self.currentUser = user
        guard let encodedMatch = try? Firestore.Encoder().encode(match) else { return }
        
        try? await Firestore.firestore().collection("match").document(match.id).setData(encodedMatch)
    }
    
}
