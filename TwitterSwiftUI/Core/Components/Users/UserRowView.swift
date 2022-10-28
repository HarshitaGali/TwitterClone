//
//  UserRowView.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 04/10/2022.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user : User
    
    var body: some View {
        HStack(spacing: 12){
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 56,height: 56)
            VStack(alignment: .leading){
                Text(user.username)
                .font(.subheadline)
                .bold()
                .foregroundColor(.black)
                
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical , 4)
    }
}

//struct UserRowView_Previews: PreviewProvider {
//    let user : User
//
//    static var previews: some View {
//        UserRowView(user: user)
//    }
//}
