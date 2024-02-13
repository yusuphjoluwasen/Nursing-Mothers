//
//  FirebaseManager.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 01/08/2023.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseStorage

class FirebaseManager: NSObject {
    
    let auth: Auth
    let storage: Storage
    let firestore: Firestore
    
    static let shared = FirebaseManager()
    
    override init() {
       // FirebaseApp.configure()
        
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        
        super.init()
    }
    
    func getTimeStamp() -> Timestamp {
        return Timestamp()
    }
    
    func uploadImage(image:UIImage, action:  ((String) -> ())?) {
        guard let uid = auth.currentUser?.uid else { return }
        let ref = storage.reference(withPath: uid)
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        ref.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                print("Failed to push image to Storage: \(err)")
                return
            }
            
            ref.downloadURL { url, err in
                if let err = err {
                    print("Failed to retrieve downloadURL: \(err)")
                    return
                }
                
                print("Successfully stored image with url: \(url?.absoluteString ?? "")")
                print(url?.absoluteString ?? "")
                
                
                guard let url = url else { return }
                action!(url.absoluteString)
            }
        }
    }
    
}


extension Timestamp{
    var time:String{
        return self.dateValue().formatted(.dateTime)
    }
}

