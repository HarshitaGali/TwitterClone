//
//  UserStatsView.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 04/10/2022.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        VStack(alignment: .leading , spacing: 12){
            
            userLocation
            
            .font(.subheadline)
            .foregroundColor(.gray)
            
            userFollowers
            
        }
        
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
extension UserStatsView {
    var userLocation : some View {
        HStack(spacing: 24){
            HStack{
                Image(systemName: "mappin.and.ellipse")
                Text("Calgary,AB")
            }
            HStack{
                Image(systemName: "link")
                Text("www.harshitagali@github.com")
            }
            
        }
    }
    
    var userFollowers : some View{
        
        HStack(spacing: 24){
            HStack{
                Text("210").font(.subheadline).bold()
                Text("Following").font(.caption).foregroundColor(.gray)
            }
            HStack{
                Text("405").font(.subheadline).bold()
                Text("Followers").font(.caption).foregroundColor(.gray)
            }
            
        }
    }
}


