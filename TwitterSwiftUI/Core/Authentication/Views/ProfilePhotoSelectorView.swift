//
//  ProfilePhotoSelectorView.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 12/10/2022.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage : UIImage?
    @State private var profileImage : Image?
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        VStack(){
            AuthenticationHeaderView(title1: "Create your Account",
                                     title2: "Add a Profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage{
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100,height: 100)
                        .padding(.top,44)
                        .clipShape(Circle())
                }else{
                    Image(systemName: "camera")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 100,height: 100)
                        .padding(.top,44)
                }
                
            }
            .sheet(isPresented: $showImagePicker,
                   onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            Text("Pick your photo")
                .foregroundColor(Color(.systemBlue))
                .font(.subheadline)
                .bold()
                
            if let selectedImage = selectedImage {
                    Button {
                        viewModel.uploadProfileImage(selectedImage)
                    } label: {
                        Text("Continue")
                            .bold()
                            .frame(width: 350 ,height: 50)
                            .background(Color(.systemBlue))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .padding(.top,40)
                }

            }

            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else{return }
        profileImage = Image(uiImage: selectedImage)
    }
}
struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}


