//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 20/10/2022.
//

import Foundation

class UploadTweetViewModel : ObservableObject{
    @Published var didUploadTweet = false
    let service  = Tweetservice()
    
    func uploadTweet(withcaption caption : String){
        service.uploadTweet(caption: caption) { success in
            if success {
                //dismiss screen
                self.didUploadTweet = true
            }
            else{
                // show error message to user
            }
        }
    }
}
