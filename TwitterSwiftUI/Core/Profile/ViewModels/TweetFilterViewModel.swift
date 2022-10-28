//
//  TweetFilterViewModel.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 04/10/2022.
//

import Foundation

//CaseIterable treats all of the enum cases as arrays
enum TweetFilterViewModel : Int,CaseIterable{
    case tweets
    case replies
    case likes
    
    var title:String{
        
        switch self{
        case .tweets : return "Tweets"
        case .replies : return "Replies"
        case .likes : return "Likes"
        }
    }
}


