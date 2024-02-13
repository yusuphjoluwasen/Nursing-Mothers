//
//  AppointmentViewModel.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 04/08/2023.
//

import Foundation
import FirebaseFirestoreSwift

class AppointmentViewModel:ObservableObject{
    
      @Published var professionallist:[UserProfile] = []
    @Published var createAppointmentStatus = false
    @Published var errorMessage = ""
    
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
    
     func createAppointment(appointment:CreateAppointment) {
        //validation
        //if does not match validation, dont proceed
        if !validate(model: appointment){
            print("hererrerererrrerer")
            return
        }
        
       guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let db = FirebaseManager.shared.firestore.collection("appointments")
        let docId = db.document().documentID
        let data = ["date": appointment.date, "email": appointment.email, "name": appointment.name, "professionalimage":appointment.professionalimage,"professionalname":appointment.professionalname, "professionaltitle" : appointment.professionaltitle, "reason": appointment.reason, "id":docId, "userid" : uid
       ]
         
       db.document(docId).setData(data) { [weak self]err in
           if let err = err {
               print(err)
               return
           }
           print("workeddddddjjddj djdjd")
           self?.createAppointmentStatus = true
       }
   }
    
    private func validate(model: CreateAppointment) -> Bool{
        if model.name.isEmpty || model.name.count < 2{
            errorMessage = "Invalid name"
            print("invalid name")
            return false
        }
        
        //if email is empty or email is not valid(does not match regex condition)
        if model.email.isEmpty || !isValidEmail(model.email){
            errorMessage = "Invalid Email"
            return false
        }
        
        if model.reason.isEmpty {
            errorMessage = "Please State Reason for Appointment"
            return false
        }
        
        if model.date.isEmpty{
            errorMessage = "Invalid date"
            return false
        }
        
        errorMessage = ""
        return true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegex, options: .caseInsensitive)
            let range = NSRange(location: 0, length: email.utf16.count)
            let matches = regex.numberOfMatches(in: email, options: .reportCompletion, range: range)
            return matches == 1
        } catch {
            return false
        }
    }

}
