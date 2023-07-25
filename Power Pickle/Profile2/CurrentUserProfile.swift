//
//  CurrentUserProfile.swift
//  Power Pickle
//
//  Created by Carson Chang on 6/30/23.
//

import SwiftUI

struct CurrentUserProfile: View {
    
    let user: User
    
    var matches: [Match] {
        return Match.MOCK_MATCHES.filter({ $0.user.username == user.username})
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                ZStack {
                    
                    //Color("BG").ignoresSafeArea()
                    
                    VStack {
                        // header
                        ProfileHeaderView(user: user)
                        
                        //post grid view
                        PreviousMatches(matches: matches).padding(.top)
                            
                            
                        }
                        
                    }
                
            }.navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            AuthService.shared.signout()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.black)
                        }

                    }
                }
            
        }
    }
}

struct CurrentUserProfile_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfile(user: User.MOCK_USERS[0])
    }
}
