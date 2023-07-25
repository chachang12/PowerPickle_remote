//
//  PrevMatchView.swift
//  Power Pickle
//
//  Created by Carson Chang on 6/29/23.
//

import SwiftUI

struct PrevMatchView: View {
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(Color("StockGreen"))
                .frame(width: UIScreen.main.bounds.width - 20, height: 300)
                .cornerRadius(23)
                .opacity(0.25)
            
            VStack {
                
                Text("Previous Match")
                    .font(.title2)
                
                ZStack {
                    
                    HStack {
                        
                        VStack (){
                            
                            Image("kimchae")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .padding(.bottom, 30)
                            
                            
                            Image("kimchae")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                        }.padding(.trailing, 100)
                        
                        VStack {
                            
                            Image("kimchae")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .padding(.bottom, 30)
                            
                            Image("kimchae")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                        }
                        
                    }
                    
                    Rectangle()
                        .frame(width: 5, height: 170)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width - 50, height: 5)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                //TODO: Do the red and green logic for wins and losses like the other one
                Text("Final")
                HStack {
                    Text("11")
                        .font(.title)
                        .padding(.trailing)
                    Text(":")
                        .font(.title)
                    Text("7")
                        .font(.title)
                        .padding(.leading)
                    
                }
                
            }
            
        }
    }
}

struct PrevMatchView_Previews: PreviewProvider {
    static var previews: some View {
        PrevMatchView()
    }
}
