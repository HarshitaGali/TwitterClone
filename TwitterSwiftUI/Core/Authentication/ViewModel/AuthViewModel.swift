//
//  AuthViewModel.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 10/10/2022.
//

import SwiftUI
import Firebase

class AuthViewModel : ObservableObject{
    //this keeps track of user Session
    @Published var userSession : FirebaseAuth.User?
    @Published var didAuthenticateUser  =  false
    @Published var currentUser : User?
    private var tempUserSession : FirebaseAuth.User?
    private let service = UserService()
    
    init(){
        //if the user is logged in , the user session is stored in userSession variable
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
        
    }
    
    func login(withEmail email : String , password:String){
        print("DEBUG : Login with Email : \(email)")
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG : Failed to login with error : \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchUser()
            
        }
    }
    func register(withEmail email : String , password : String , fullname : String , userName : String ){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG : Failed to register with error : \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.tempUserSession = user

            //self.userSession = user
            print("DEBUG : Registered User Successfully")
            print("User is \(String(describing: self.userSession))")
            
            let data = ["email": email,
                        "username":userName.lowercased(),
                        "fullname": fullname,
                        "user":user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data){ _ in
                    print("DEBUG : Did upload user data")
                    self.didAuthenticateUser = true
                }
        }
    }
    
    func signOut(){
        //sets userSession to nil , so we show login view
        userSession = nil
        //signs user out on server
        try?Auth.auth().signOut()
        
    }
    func uploadProfileImage(_ image:UIImage){
        guard let uid = tempUserSession?.uid else { return }
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]){ _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        }
    }
    func fetchUser(){
        guard let uid = self.userSession?.uid else { return }
        // when this func call completes , we get access to a user and set that @published propert current user to user property in db
          service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
        
    }
}
