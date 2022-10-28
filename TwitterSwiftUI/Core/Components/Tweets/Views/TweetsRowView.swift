//
//  TweetsRowView.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 03/10/2022.
//

import SwiftUI
import Kingfisher

struct TweetsRowView: View {
   
   @ObservedObject var tweetViewModel : TweetViewModel
    
    init(tweet: Tweet) {
        self.tweetViewModel = TweetViewModel(tweet: tweet)
    }
    var body: some View {
        
        VStack(alignment: .leading){
            //profile image + user Info + tweet
            
            if let user = tweetViewModel.tweet.user{
                        HStack(alignment:.top, spacing: 12){
                            
                            KFImage(URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 56,height: 56)
                            

                            //User Info
                            VStack(alignment: .leading,spacing: 4){
                        HStack{
                            Text(user.fullname).font(.subheadline).bold()
                            Text("@\(user.username)").font(.caption).foregroundColor(.gray)
                            Text("2W").font(.caption).foregroundColor(.gray)
                        }
                                // tweet Caption
                                Text(tweetViewModel.tweet.caption)
                    }
                    
                    
                   
                }
            }
            
            //action buttons
            HStack{
                Button{
                    
                }label: {
                    Image(systemName: "bubble.left")
                        
                }
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "arrow.2.squarepath")
                        
                }
                Spacer()
                Button{
                    tweetViewModel.tweet.didLike ?? false ?
                    tweetViewModel.unlikeTweet() :
                    tweetViewModel.likeTweet()
                    
                }label: {
                    Image(systemName: tweetViewModel.tweet.didLike ?? false ?  "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(tweetViewModel.tweet.didLike ?? false ? .red : .gray)
                        
                }
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "bookmark")
                }
               
            }
            .padding()
            .font(.subheadline)
            .foregroundColor(.gray)
            Divider()
           
        }
        .padding()
        
    }
}


