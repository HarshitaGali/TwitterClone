//
//  Tweet.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 20/10/2022.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable , Decodable ,Hashable {
    @DocumentID var id : String?
    let caption : String
    let timestamp : Timestamp
    let uid : String
    var likes :Int
    
    var user : User?
    var didLike : Bool? = false
    
}
