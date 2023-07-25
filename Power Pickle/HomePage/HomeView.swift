//
//  HomeView.swift
//  Power Pickle
//
//  Created by Carson Chang on 6/29/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    //let match: Match
    let user: User
    
    var body: some View {
        NavigationStack {
            ZStack {
                /*Color("BG")
                    .ignoresSafeArea()*/
                
                VStack {
                    HStack {
                        Image("picklelogo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.leading, 10.0)
                            .frame(width: 78, height: 80)
                            .padding(10)
                        
                        Spacer()
                        
                        ProfileImageView(user: user, size: .large)
                            .padding(10)
                    }
                    
                    
                    
                    Group {
                        ZStack {
                            
                            Rectangle()
                                .foregroundColor(Color("StockGreen"))
                                .frame(width: UIScreen.main.bounds.width - 20, height: 250)
                                .cornerRadius(23)
                                .opacity(0.25)
                            
                            VStack {
                                // TODO: Make actual user name appear
                                
                                Text("UserName")
                                    .fontWeight(.semibold)
                                
                                Image("4")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 110, height: 138)
                                
                                Text("Pickle Pro")
                                    .fontWeight(.semibold)
                                
                                Text("1550")
                                    .fontWeight(.medium)
                            }
                        }
                    }
                    
                    PrevMatchView()
                    //ProfilePrevMatchesView()
                    
                    Spacer()
                    
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: User.MOCK_USERS[0])
    }
}
