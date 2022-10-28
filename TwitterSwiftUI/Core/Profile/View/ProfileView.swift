//
//  ProfileView.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 03/10/2022.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @ObservedObject var feedViewModel = FeedViewModel()
    @State private var selectedFilter : TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    @ObservedObject var profileViewModel : ProfileViewModel
    @Namespace var animation
    
    
    init(user:User){
        self.profileViewModel = ProfileViewModel(user: user)
    }
    var body: some View {
        VStack(alignment: .leading){
            
            headerView
            
            actionButtons
            
            userInfo
           
            tweetFilterBar
            
            tweetsView
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id : NSUUID().uuidString,
                               username: "@ios Developer",
                               fullname: "Harshita Gali",
                               profileImageUrl: "person",
                               email: "ghrashita544@gmail.com"))
    }
}

extension ProfileView{
    //MARK: - headerView
    var headerView : some View{
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue).ignoresSafeArea()
            
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20,height: 16)
                        .foregroundColor(.white)
                        .offset(x:16,y:-4)
                }

                KFImage(URL(string: profileViewModel.user.profileImageUrl))
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFill()
                    .frame(width: 72,height: 72)
                    .offset(x:16,y:24)
            }
        }
        .frame(height: 96)
    }
    
    //MARK: - actionButtons
    var actionButtons : some View{
        HStack(spacing: 12){
            Spacer()
            Image(systemName:"bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray,lineWidth: 0.75))
            Button {
            } label: {
                Text(profileViewModel.actionButtonTitle)
                    .foregroundColor(Color.black)
                    .font(.subheadline).bold()
                    .frame(width: 120,height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray,lineWidth: 0.75))
            }

        }
        .padding(.trailing)
    }
    
    //MARK: - userInfo
    var userInfo : some View{
        
        VStack(alignment: .leading, spacing: 4){
            
            HStack {
                Text(profileViewModel.user.fullname)
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            Text(profileViewModel.user.username)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Tech Enthusiast")
                .font(.subheadline)
                .padding(.vertical)
            
             UserStatsView()
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    //MARK: - tweetFilterBar
    var tweetFilterBar : some View{
        HStack{
            ForEach(TweetFilterViewModel.allCases,id: \.rawValue) { item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if(selectedFilter == item){
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }else{
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectedFilter  = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x:0, y:16))
    }
    
    //MARK: - tweetsView
    var tweetsView : some View{
        ScrollView{
            LazyVStack{
                ForEach(profileViewModel.tweets(forFilter: self.selectedFilter)) { tweet in
                   TweetsRowView(tweet: tweet)
                }
            }
        }
    }
}
