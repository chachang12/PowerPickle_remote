//
//  MatchLoaderViewModel.swift
//  Power Pickle
//
//  Created by Carson Chang on 7/24/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

func fetchMatchFromFirestore(matchID: String, completion: @escaping (Match?) -> Void) {
    let db = Firestore.firestore()
    let matchesRef = db.collection("matches")
    
    matchesRef.whereField("id", isEqualTo: matchID).getDocuments { (querySnapshot, error) in
        if let error = error {
            print("Error getting match document: \(error)")
            completion(nil)
            return
        }
        
        guard let documents = querySnapshot?.documents, !documents.isEmpty,
              let matchData = documents.first?.data(),
              let matchID = matchData["id"] as? String,
              let userID = matchData["user"] as? String,
              let teammateID = matchData["teammate"] as? String,
              let opponent1ID = matchData["opponent2"] as? String,
              let opponent2ID = matchData["opponent2"] as? String,
              let team1score = matchData["team1score"] as? Int,
              let team2score = matchData["team2score"] as? Int,
              let winner = matchData["winner"] as? [String] else {
            // Match not found or data mapping error
            completion(nil)
            return
        }
        
        let match = Match(id: matchID, user: userID, teammate: teammateID, opponent1: opponent1ID, opponent2: opponent2ID, team1score: team1score, team2score: team2score, winner: winner)
        completion(match)
    }
}
