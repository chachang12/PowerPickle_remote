//
//  ContentView.swift
//  Power Pickle
//
//  Created by Carson Chang on 6/20/23.
//

import SwiftUI
struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(RegistrationViewModel())
            } else if let currentUser = viewModel.currentUser {
                TaskBarView(user: currentUser)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



