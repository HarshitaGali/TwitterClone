//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 09/10/2022.
//

import SwiftUI

struct RegistrationView: View {
    @State private var rEmail = ""
    @State private var rUserName = ""
    @State private var rFullName = ""
    @State private var rPassword = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        VStack{
        
            NavigationLink(destination: ProfilePhotoSelectorView(),
                           isActive: $viewModel.didAuthenticateUser,
                           label: {})
        
            //headerView
            AuthenticationHeaderView(title1: "Get Started.", title2: "Create your Account")
            
            userInfo
            .padding(.horizontal,32)
            .padding(.top,44)
            
            signUpButton
            .shadow(radius: 10)
            
            Spacer()
            
            signInNavView
            
        }
        .ignoresSafeArea()
       
        }
    }


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

extension RegistrationView {
    
    var userInfo : some View{
        VStack(spacing: 40) {
            CustomInputField(imageName: "envelope", placeholderText: "Email", text: $rEmail)
            
            
            CustomInputField(imageName: "person", placeholderText: "Username", text: $rUserName)
            
            CustomInputField(imageName: "person", placeholderText: "Full name", text: $rFullName)
            
            CustomInputField(imageName: "lock", placeholderText: "Password",isSecureField: true, text: $rPassword)
        }
    }
    
    var signUpButton : some View {
        Button {
            viewModel.register(withEmail: rEmail, password: rPassword, fullname: rFullName, userName: rUserName)
        } label: {
            Text("Sign up")
                .bold()
                .frame(width: 350 ,height: 50)
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Capsule())
                .padding(.top,40)
            
        }
    }
    
    var signInNavView : some View{
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            HStack{
                Text("Already have an acccount?")
                Text("Sign in")
                    .fontWeight(.bold)
            }
            .font(.footnote)
            .foregroundColor(Color(.systemBlue))
            .padding(.bottom,32)
        }
    }
}
