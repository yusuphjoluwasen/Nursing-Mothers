//
//  ReportViewModel.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 04/08/2023.
//

import Foundation
import Combine
import FirebaseFirestoreSwift

class ReportViewModel:ObservableObject{
    
    @Published var createReportStatus = false
    @Published var createFeedbackStatus = false
    @Published var errorMessage = ""

    
     func createReport(report:CreateReport) {
        //validation
        //if does not match validation, dont proceed
         if report.whattoreport.isEmpty || report.nameofpersontoreport.isEmpty{
             errorMessage = "fill all fields"
         }
        
       guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let db = FirebaseManager.shared.firestore.collection("appointments")
        let docId = db.document().documentID
         let data = ["nameofpersontoreport": report.nameofpersontoreport, "useremail": report.useremail, "whattoreport": report.whattoreport, "id":docId, "uid" : uid
       ]
         
       db.document(docId).setData(data) { [weak self]err in
           if let err = err {
               print(err)
               return
           }
           
           self?.errorMessage = ""
           
           self?.createReportStatus = true
       }
   }
    
    func createFeedback(feedback:CreateFeedback) {
       //validation
       //if does not match validation, dont proceed
        if feedback.whattoimprove.isEmpty{
            errorMessage = "fill all fields"
        }
       
      guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
       let db = FirebaseManager.shared.firestore.collection("appointments")
       let docId = db.document().documentID
        let data = ["whattoimprove": feedback.whattoimprove, "whatyoulike": feedback.whatyoulike, "useremail": feedback.useremail, "id":docId, "uid" : uid, "chattopic": feedback.chattopic
      ]
        
      db.document(docId).setData(data) { [weak self]err in
          if let err = err {
              print(err)
              return
          }
          
          self?.errorMessage = ""
          
          self?.createReportStatus = true
      }
  }

}

