//
//  ProfessionalsViewModel.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 04/08/2023.
//

import Foundation
import Combine
import FirebaseFirestoreSwift

class ProfessionalViewModel:ObservableObject{
    
      @Published var professionallist:[UserProfile] = []
    
    func fetchProfesssionals() {
       FirebaseManager.shared.firestore.collection("users")
           .getDocuments { [weak self] documentsSnapshot, error in
               if let error = error {
                   print("Failed to fetch users: \(error)")
                   return
               }
               self?.professionallist = []
               
               documentsSnapshot?.documents.forEach({ [weak self] snapshot in
                   let proffesional = try? snapshot.data(as: UserProfile.self)
                   if proffesional?.usertype.lowercased() == "professional"{
                       self?.professionallist.append(proffesional!)
                   }
               })
           }
   }

}
