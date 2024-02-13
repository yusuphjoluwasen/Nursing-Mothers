//
//  RegisterViewModel.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 01/08/2023.
//

import Foundation
import Foundation
import Combine
import UIKit

final class RegisterViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var signUpStatus = false
    
    func createNewAccount(model:RegisterModel) {
       
        if !validate(model: model){
            return
        }
        
        FirebaseManager.shared.auth.createUser(withEmail: model.email.lowercased(), password: model.password) { [self] result, err in
            if let err = err {
                print("Failed to create user:", err)
                self.errorMessage = "Failed to create user: \(err)"
                return
            }
            
            print("Successfully created user: \(result?.user.uid ?? "")")
            
            //upload image
            if model.image != nil{
                FirebaseManager.shared.uploadImage(image: model.image ?? UIImage()) { [weak self] imageurl in
                    self?.storeUserInformation(model: model, image:imageurl)
                }
            }else{
                storeUserInformation(model: model)
             }
            
        }
    }
    
    private func storeUserInformation(model:RegisterModel, image:String = "") {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let userData = ["email": model.email, "id": uid, "name":model.name, "bio":model.bio,"usertype":model.userType,
                        "jobtitle":model.jobtitle,  "profilepicture":image
        ]
        
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(userData) { [weak self] err in
                if let err = err {
                    print(err)
                    self?.errorMessage = "\(err)"
                    return
                }
                self?.signUpStatus = true
                print("Success")
            }
    }
    
    
    private func validate(model: RegisterModel) -> Bool{
        if model.name.isEmpty || model.name.count < 2{
            errorMessage = "Invalid name"
            print("inavlid name")
            return false
        }
        
        if model.email.isEmpty || !isValidEmail(model.email){
            errorMessage = "Invalid Email"
            return false
        }
        
        if model.password.isEmpty || model.password.count < 6{
            errorMessage = "Invalid Password, password should be 6 characters or more"
            return false
        }
        
        if model.userType == "Proffesional" && model.jobtitle.isEmpty{
            errorMessage = "A profesional must enter a job title"
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
