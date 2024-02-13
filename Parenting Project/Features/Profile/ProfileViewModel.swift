//
//  ProfileViewModel.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 04/08/2023.
//

import Foundation
import Combine
import FirebaseFirestoreSwift

final class ProfileViewModel: ObservableObject {
    
    @Published var user:UserProfile?
    @Published var fetchData:Bool = false
    @Published var appointmentlist:[Appointment] = []
    
    func fetchAppointments() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
       FirebaseManager.shared.firestore.collection("appointments")
           .getDocuments { [weak self] documentsSnapshot, error in
               if let error = error {
                   print("Failed to fetch appointments: \(error)")
                   return
               }
               self?.appointmentlist = []
               
               documentsSnapshot?.documents.forEach({ [weak self] snapshot in
                   let appointment = try? snapshot.data(as: Appointment.self)
                   if appointment?.userid == uid{
                       self?.appointmentlist.append(appointment!)
                  }
               })
           }
   }

     func fetchProfile() {
         //get logged in user
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let user = FirebaseManager.shared.firestore.collection("users").document(uid)
        
        user.getDocument { [weak self](document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }
            
            if let document = document, document.exists {
                let user = try? document.data(as: UserProfile.self)
                self?.fetchData = true
                self?.updateProfile(user: user)
            }
        }
    }
    
    func updateProfile(user: UserProfile?){
        self.user = user
    }
}
