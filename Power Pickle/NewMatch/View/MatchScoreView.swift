//
//  MatchScoreView.swift
//  Power Pickle
//
//  Created by Carson Chang on 7/12/23.
//

import SwiftUI

struct MatchScoreView: View {
    
    @State var user: User
    
    @State var teammate: User
    
    @State var opponent1: User
    
    @State var opponent2: User
    
    var body: some View {
        /*ZStack {
            Color("StockGreen")
                .opacity(0.4)
                .ignoresSafeArea()*/
            
            VStack {
                HStack {
                    
                    VStack {
                        
                        // Team ONE
                        
                        VStack {
                            
                            ProfileImageView(user: user, size: .medium)

                            Text(user.username)
                            
                        }
                        .padding(.bottom)
                        
                        
                        VStack {
                            
                            ProfileImageView(user: teammate, size: .medium)

                            Text(teammate.username)
                            
                        }
                        
                    }
                    .padding(.trailing, 100)
                    
                    
                    
                    
                    VStack {
                        
                        // Team TWO
                        
                        VStack {
                            
                            ProfileImageView(user: opponent1, size: .medium)

                            Text(opponent1.username)
                            
                        }
                        .padding(.bottom)
                        
                        VStack {
                            
                            ProfileImageView(user: opponent2, size: .medium)

                            Text(opponent2.username)
                            
                        }
                        
                    }
                    
                }
                
                
                
            }
        //}
    }
}

struct MatchScoreView_Previews: PreviewProvider {
    static var previews: some View {
        MatchScoreView(user: User.MOCK_USERS[0], teammate: User.MOCK_USERS[1], opponent1: User.MOCK_USERS[2], opponent2: User.MOCK_USERS[3])
    }
}
