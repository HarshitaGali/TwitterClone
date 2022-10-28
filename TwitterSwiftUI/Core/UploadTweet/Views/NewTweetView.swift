//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 09/10/2022.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel : AuthViewModel
    @ObservedObject var viewmodel = UploadTweetViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                Spacer()
                Button {
                    viewmodel.uploadTweet(withcaption: caption)
                    
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                    
                    
                }

            }
            .padding()
            
            HStack(alignment: .top){
                if let user = authViewModel.currentUser{
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64,height: 64)
                }
               
                TextArea("What's Happening ?", text: $caption)
              
            }
            .padding()
        }
        .onReceive(viewmodel.$didUploadTweet) { success in
            if success{
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    var viewmodel : UploadTweetViewModel
    static var previews: some View {
        NewTweetView()
    }
}
