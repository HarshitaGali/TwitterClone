//
//  TweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 21/10/2022.
//

import Foundation

class TweetViewModel : ObservableObject{
    @Published var tweet : Tweet
    let service = Tweetservice()
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
    func likeTweet(){
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
    func unlikeTweet(){
        service.likeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
    
    func checkIFUserLikedTweet(){
        service.checkIFUserLikedTweet(tweet) { didLike in
            if didLike{
                self.tweet.didLike = true
            }
        }
    }
}
