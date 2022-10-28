//
//  User.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 14/10/2022.
//

import FirebaseFirestoreSwift
import Firebase

struct User : Identifiable , Decodable , Hashable{
    //read the document id and store it in id property
    @DocumentID var id  : String?
    let username : String
    let fullname : String
    let profileImageUrl : String
    let email : String
    
    var isCurrentUser : Bool {return Auth.auth().currentUser?.uid == id}
}
