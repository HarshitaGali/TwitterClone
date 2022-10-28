//
//  ProfileViewModel.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 20/10/2022.
//

import Foundation

class ProfileViewModel : ObservableObject {
    @Published var tweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    let service = Tweetservice()
    let userService = UserService()
    let user : User
    
    
    init(user:User){
        self.user = user
        self.fetchUsersTweets()
        self.fetchLikedTweets()
    }
    
    var actionButtonTitle : String{
        return user.isCurrentUser ? "Edit Profile" : "Follow"
    }
    
    
    func tweets(forFilter filter:TweetFilterViewModel) -> [Tweet]{
        switch(filter){
        case .tweets :
            return tweets
        case .replies :
            return tweets
        case .likes:
            return likedTweets
        }

    }
    func fetchUsersTweets(){
        guard let uid = user.id else { return }
        service.fetchTweets(forUid: uid ) { tweets in
            self.tweets = tweets
            
            for i in 0..<tweets.count{
                self.tweets[i].user = self.user
            }
        }
    }
    
    func fetchLikedTweets(){
        guard let uid = user.id else { return }
        service.fetchLikedTweets(forUid: uid) { tweet in
            self.likedTweets = tweet
            
            for i in 0..<tweet.count{
                let uid = tweet[i].uid
                
                self.userService.fetchUser(withUid : uid) { user in
                    self.likedTweets[i].user = user
                }
            }
            }
        }
    }

