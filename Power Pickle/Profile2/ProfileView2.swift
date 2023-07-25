//
//  ProfileView2.swift
//  Power Pickle
//
//  Created by Carson Chang on 6/29/23.
//

import SwiftUI

struct ProfileView2: View {
    
    let user: User
    
    var matches: [Match] {
        return Match.MOCK_MATCHES.filter({ $0.user.username == user.username})
    }
    
    var body: some View {

            ScrollView {
                
                ZStack {
                    
                    //Color("BG").ignoresSafeArea()
                    
                    VStack {
                        // header
                        ProfileHeaderView(user: user)
                        
                        //post grid view
                        PreviousMatches(matches: matches)
                            .padding(.top)
                            
                            
                        }
                        
                    }
                
            }.navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                

    }
}

struct ProfileView2_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView2(user: User.MOCK_USERS[0])
    }
}
