//
//  SearchView.swift
//  Power Pickle
//
//  Created by Carson Chang on 6/29/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = searchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack (spacing: 12){
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            
                            HStack {
                                                        
                                ProfileImageView(user: user, size: .xsmall)
                                
                                VStack (alignment: .leading) {
                                    
                                    Text(user.username).fontWeight(.semibold)
                                    
                                    Text(user.fullname ?? "")
                                    
                                }.font(.footnote)
                                
                                Spacer()
                                
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            
                        }
                        
                    }
                }
                .padding(.top)
                .searchable(text: $searchText, prompt: "Find friends")
            }
            .navigationDestination(for: User.self, destination: { user in ProfileView2(user: user)})
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
