//
//  TaskBarView.swift
//  Power Pickle
//
//  Created by Carson Chang on 6/29/23.
//

import SwiftUI

struct TaskBarView: View {
    let user: User
    var body: some View {
        TabView {
            HomeView(user: user)
                .tabItem {
                    Image(systemName: "house")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            NewMatchView(user: user, teammate: user, opponent1: user, opponent2: user)
                .tabItem {
                    Image(systemName: "plus.square")
                }
            
            CurrentUserProfile(user: user)
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .accentColor(Color("StockGreen"))
    }
}

struct TaskBarView_Previews: PreviewProvider {
    static var previews: some View {
        TaskBarView(user: User.MOCK_USERS[0])
    }
}
