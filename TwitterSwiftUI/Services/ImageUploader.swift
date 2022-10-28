//
//  ImageUploader.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 13/10/2022.
//


import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader{
    // onupload we need to get the path of the image that is stored
    static func uploadImage(image: UIImage , completion : @escaping(String)-> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else{ return }
        
        let fileName  = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_image/\(fileName)")
        
        storageRef.putData(imageData) { _, error in
            if let error = error{
                print("DEBUG : Failed to upload image with error: \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else { return }
                print("DEBUG : downloaded image: \(imageUrl)")
                completion(imageUrl)
            }
        }
 
    }
}
