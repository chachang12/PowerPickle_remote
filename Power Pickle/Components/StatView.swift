//
//  StatView.swift
//  Power Pickle
//
//  Created by Carson Chang on 6/29/23.
//

import SwiftUI

struct StatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
            
            Text("\(value)")
        }.frame(width: 76)
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(value: 12, title: "Friends")
    }
}
