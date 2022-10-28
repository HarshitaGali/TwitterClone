//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 03/10/2022.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var feedViewModel = FeedViewModel()
    @State private var showTweetView  = false
   
    var body: some View {
        ZStack(alignment:.bottomTrailing) {
            //listView
            ScrollView{
                LazyVStack{
                    ForEach(feedViewModel.tweets){ tweet in
                        
                        TweetsRowView(tweet: tweet)
      
                    }
                }
            }
            //FloatingActionButton
            Button {
                showTweetView.toggle()
            } label: {
                Image(systemName: "pencil.line")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28,height: 28)
                    .padding()
                    .foregroundColor(.white)
            }
                    .background(Color(.systemBlue))
                    .clipShape(Circle())
                    .padding()
                    .fullScreenCover(isPresented: $showTweetView) {
                        NewTweetView()
                    }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
