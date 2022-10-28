//
//  LoginView.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 09/10/2022.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel : AuthViewModel
    
    
    var body: some View {
        
        VStack{
            AuthenticationHeaderView(title1: "Hello.", title2: "Welcome Back")
  
            loginInfo
            .padding(.horizontal,32)
            .padding(.top,44)
            
            forgotPassword
           
            signInButton
            .shadow(color:.gray ,radius: 10)

            Spacer()
            
            signUpLink
            
            
        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView{
    
    var loginInfo : some View{
        VStack(spacing: 40){
            
            CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
            
            CustomInputField(imageName: "lock", placeholderText: "Password",isSecureField: true, text: $password)
            
        }
    }
    
    var forgotPassword : some View {
        HStack{
            Spacer()
            
            NavigationLink {
                Text("Reset Password Link")
            } label: {
                Text("Forgot Password?")
                    .foregroundColor(Color(.systemBlue))
                    .fontWeight(.bold)
                    .padding(.top)
                    .padding(.trailing,24)
            }

        }
    }
    
    var signInButton : some View{
        Button {
            viewModel.login(withEmail: email, password: password)
        } label: {
            Text("Sign In")
                .bold()
                .frame(width: 350,height: 50)
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Capsule())
                .padding()
            
        }
        
    }
    
    var signUpLink : some View {
        NavigationLink {
           RegistrationView()
                .toolbar(.hidden)
        } label: {
            HStack{
                Text("Don't have an account?")
                    
                Text("Sign Up")
                    .fontWeight(.bold)
                    
            }
            .font(.footnote)
            .foregroundColor(Color(.systemBlue))
            .padding(.bottom,32)
        }
    }
}
