//
//  NewMatchFunc.swift
//  Power Pickle
//
//  Created by Carson Chang on 7/20/23.
//

import Foundation

class NewMatchFunc {
    
    static func detWinner(score1: String, score2: String) -> Int {
        
        var s1 = 0
        
        var s2 = 0
        
        s1 = Int(score1) ?? 0
        
        s2 = Int(score2) ?? 0
        
        if s1 > s2 {
            
            return 1
            
        } else {
            
            return 2
            
        }
        
        
    }
    
}
