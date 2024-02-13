//
//  MessagingViewModel.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 04/08/2023.
//

import Foundation
import Combine
import Firebase

class MeassagingViewModel:ObservableObject{
    
    @Published var messagingrooms:[MessagingRoom] = []
    @Published var roommessages:[Message] = []
    var firestoreListener: ListenerRegistration?
    
    func addToMessages(message:CreateMessage) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
         let db = FirebaseManager.shared.firestore.collection("messagerooms")
            .document(message.roomid)
             .collection("messages")
         let docId = db.document().documentID
         
        let data:[String:Any] = ["roomid": message.roomid, "item":message.item, "username":message.username,
                                 "userid":uid, "time":FirebaseManager.shared.getTimeStamp(), "id":docId
        ]
        
         db.document(docId).setData(data) { err in
            if let err = err {
                print(err)
                return
            }
            print("Success")
        }
    }
    
    func fetchRooms() {
       FirebaseManager.shared.firestore.collection("messagerooms")
           .getDocuments { [weak self] documentsSnapshot, error in
               if let error = error {
                   print("Failed to fetch rooms: \(error)")
                   return
               }
               self?.messagingrooms = []
               
               documentsSnapshot?.documents.forEach({ [weak self] snapshot in
                   let room = try? snapshot.data(as: MessagingRoom.self)
                   self?.messagingrooms.append(room!)
               })
           }
   }
    
    
    func fetchRoomMessages(roomid:String) {
        firestoreListener?.remove()
        roommessages.removeAll()
        firestoreListener = FirebaseManager.shared.firestore.collection("messagerooms")
           .document(roomid)
           .collection("messages")
           .order(by: "time")
           .addSnapshotListener { querySnapshot, error in
               if let error = error {
                   print( "Failed to listen for messages: \(error)")
                   return
               }
               
               querySnapshot?.documentChanges.forEach({ [weak self] change in
                   if change.type == .added {
                       do {
                           let msg = try change.document.data(as: Message.self)
                           self?.roommessages.append(msg)
                       } catch {
                           print("Failed to decode message: \(error)")
                       }
                   }
               })
           }
   }
    
    func getUserId() -> String{
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return "" }
        return uid
    }
    
}
