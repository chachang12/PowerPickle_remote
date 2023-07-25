//
//  PreviousMatches.swift
//  Power Pickle
//
//  Created by Carson Chang on 7/5/23.
//

import SwiftUI

struct PreviousMatches: View {
    
    var  matches: [Match]
    
    var body: some View {
        LazyVStack (spacing: 20){
            ForEach(matches) { match in
                ProfilePrevMatchesView(match: match)
            }
        }
    }
}

struct PreviousMatches_Previews: PreviewProvider {
    static var previews: some View {
        PreviousMatches(matches: Match.MOCK_MATCHES)
    }
}
