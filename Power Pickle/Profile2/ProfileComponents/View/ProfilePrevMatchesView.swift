//
//  ProfilePrevMatchesView.swift
//  Power Pickle
//
//  Created by Carson Chang on 6/29/23.
//

import SwiftUI

struct ProfilePrevMatchesView: View {
    
    let match: Match
    
    var body: some View {
        ZStack {
            
            //Color("BG").ignoresSafeArea()
            
            Rectangle()
                .foregroundColor(Color("StockGreen"))
                .frame(width: UIScreen.main.bounds.width - 20, height: 150)
                .cornerRadius(23)
                .opacity(0.25)
            
            HStack{
                
                VStack{
                    
                    Text("Final")
                        .font(.title3)
                        .padding(.bottom)
                    HStack {
                        // TODO: IF won highlight score green, if loss highlight score red
                        Text(String(match.team1score))
                            .font(.title)
                            .padding(.trailing)
                        Text(":")
                            .font(.title)
                        Text(String(match.team2score))
                            .font(.title)
                            .padding(.leading)
                        
                    }
                    .padding(.bottom)
                    // TODO: Implement MMR System
                    Text("+ 22")
                        .font(.subheadline)
                    // TODO: For up green for down red
                    
                }
                
                ZStack {
                    
                    HStack {
                        
                        VStack (){
                            
                            // Denote as current user
                            
                            ZStack{
                                
                                /*Circle().frame(width: 60)
                                    .padding(.bottom, 20)
                                    .foregroundColor(.white)*/
                                
                                /*Image(match.user.profileImageUrl ?? "")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .padding(.bottom, 20)*/
                                
                                ProfileImageView(user: match.user, size: .small)
                                    .padding(.bottom, 20)
                                
                            }
                            
                            
                            ProfileImageView(user: match.teammate, size: .small)
                                
                            
                        }.padding(.trailing, 50)
                        
                        VStack {
                            
                            ProfileImageView(user: match.opponent1, size: .small)
                                .padding(.bottom, 20)
                            
                            ProfileImageView(user: match.opponent2, size: .small)
                            
                        }
                        
                    }
                    
                    
                    Rectangle()
                        .frame(width: 5, height: 120)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                    
                    Rectangle()
                        .frame(width: 225, height: 5)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }.padding(.leading)
                
            }
        }
    }
}

struct ProfilePrevMatchesView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePrevMatchesView(match: Match.MOCK_MATCHES[1])
    }
}
