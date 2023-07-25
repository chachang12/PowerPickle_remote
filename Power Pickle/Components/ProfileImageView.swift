//
//  ProfileImageView.swift
//  Power Pickle
//
//  Created by Carson Chang on 7/6/23.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xsmall
    case small
    case medium
    case large
    case xlarge
    
    var dimension: CGFloat {
        switch self {
        case .xsmall:
            return 40
        case .small:
            return 48
        case .medium:
            return 64
        case .large:
            return 80
        case .xlarge:
            return 100
        }
    }
}

struct ProfileImageView: View {
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        
            if let imageUrl = user.profileImageUrl {
                KFImage(URL(string: imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.dimension, height: size.dimension)
                    .clipShape(Circle())
            } else{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: size.dimension, height: size.dimension)
                    .clipShape(Circle())
                    .foregroundColor(Color(.systemGray4))
            }
            

      
        
       
        
            }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(user: User.MOCK_USERS[0], size: .large)
    }
}
