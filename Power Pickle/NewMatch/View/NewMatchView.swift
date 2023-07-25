//
//  NewMatchView.swift
//  Power Pickle
//
//  Created by Carson Chang on 7/5/23.
//

import SwiftUI

struct NewMatchView: View {
    let user: User
    
    @StateObject var viewModel = NewMatchViewModel()
    
    @State var teammate: User
    
    @State var opponent1: User
    
    @State var opponent2: User
    
    @State private var team1Score: String = ""
    
    @State private var team2Score: String = ""
    
    @State var winnerID = 0
    
    @State var winner = [""]
    
    @State var t1s = 0
    
    @State var t2s = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("StockGreen")
                    .ignoresSafeArea()
                    .opacity(0.25)

                    /*ZStack {
                        
                        Rectangle()
                            .frame(width: 5, height: 600)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                        
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width - 25, height: 5)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                        
                    }.padding(.bottom)*/
                    
                        
                        VStack {
                            VStack{
                                    Form {
                                        Section {
                                            VStack {
                                                Text("Team One")
                                                    .padding(.bottom)
                                                
                                                HStack {
                                                    
                                                    Text("You")
                                                    
                                                    Spacer()
                                                    
                                                    Text(user.fullname ?? "")
                                                    
                                                }
                                                Picker("Team Mate", selection: $teammate) {
                                                    
                                                    ForEach(viewModel.users, id: \.self) {
                                                        
                                                        Text($0.fullname ?? "").tag(teammate)
                                                        
                                                        }
                                                    
                                                    }
                                                }
                                            }

                                        Section {

                                            VStack {
                                                
                                                // Team two
                                                
                                                    
                                                
                                                Text("Team Two")
                                                
                                                Picker("Opponent", selection: $opponent1) {
                                                    
                                                    ForEach(viewModel.users, id: \.self) {
                                                        
                                                        Text($0.fullname ?? "")
                                                    }
                                                }
                                                    
                                                Picker("Opponent", selection: $opponent2) {
                                                    
                                                    ForEach(viewModel.users, id: \.self) {
                                                        
                                                        Text($0.fullname ?? "")
                                                    }
                                                }

                                            }
                                            
                                        }
                                        
                                        TextField("Team 1 Score", text: $team1Score)
                                        TextField("Team 2 Score", text: $team2Score)
                                        
                                        
                                        
                                        
                                        
                                        
                                    }.scrollContentBackground(.hidden)
                                    .scrollDisabled(true)
                        }
                            
                            Button {
                                winnerID = NewMatchFunc.detWinner(score1: team1Score, score2: team2Score)
                                
                                if winnerID == 1 {
                                    
                                    winner = [user.id, teammate.id]
                                    
                                } else {
                                    
                                    winner = [opponent1.id, opponent2.id]
                                    
                                }
                                
                                Task {
                                    
                                    await NewMatch.uploadMatchData(id: NSUUID().uuidString, user: user.id, teammate: teammate.id, opponent1: opponent1.id, opponent2: opponent2.id, team1score: Int(team1Score) ?? 0, team2score: Int(team2Score) ?? 0, winner: winner)
                                    
                                }
                                
                                
                            } label: {
                                Text("Submit Match Results")
                            }

                            
                            // SCORE INPUT
                            //MatchScoreView(user: user, teammate: teammate, opponent1: opponent1, opponent2: opponent2)
                            //ProfileImageView(user: opponent1, size: .medium)
                            //Text(opponent1.fullname ?? "")
                            
                            
                            
                            
                            
                    }
                }
                .navigationTitle("New Match")
                .navigationBarTitleDisplayMode(.inline)
                     
            }
            
        }
        
    }


struct NewMatchView_Previews: PreviewProvider {
    static var previews: some View {
        NewMatchView(user: User.MOCK_USERS[0], teammate: User.MOCK_USERS[0], opponent1: User.MOCK_USERS[0], opponent2: User.MOCK_USERS[0])
    }
}
