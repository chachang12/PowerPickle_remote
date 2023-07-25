//
//  ProfileHeaderView.swift
//  Power Pickle
//
//  Created by Carson Chang on 7/5/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User
    @State private var showEditProfile = false
    
    var body: some View {
        VStack {
            
            VStack {
                          
                HStack {
                    
                    ProfileImageView(user: user, size: .xlarge)
                        .padding(.leading, 60)
                    
                    Spacer()
                    
                    Image("4")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 110, height: 138)
                        .padding(.trailing, 60)
                    
                }

                // name
                Text(user.fullname ?? "")
                    .font(.title)
                
            }
            
            HStack {
                
                StatView(value: user.matchesPlayed ?? 0, title: "Matches")
                
                StatView(value: user.wins ?? 0, title: "Wins")
                // TODO: Implement friends, probably with a count over an list of friends
                StatView(value: 4, title: "Friends")
                
            }.padding(.top, 1)
            
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("follow user")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color("StockGreen"))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(user.isCurrentUser ? .gray : .clear , lineWidth: 1))
            }

            
        }.fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
