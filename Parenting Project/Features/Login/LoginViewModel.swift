//
//  LoginViewModel.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 01/08/2023.
//

import Foundation
import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var loginStatus = false
  
    
    func loginUser(model:LoginModel) {
        //validation
        if model.email.isEmpty || model.password.isEmpty{
            self.errorMessage = "email or password cannot be empty"
            return
        }
        
        if model.password.count < 6{
            self.errorMessage = "Invalid Password, password should be 6 characters or more"
            return
        }
        
        errorMessage = ""

        FirebaseManager.shared.auth.signIn(withEmail: model.email.lowercased() , password: model.password) { [weak self] result, err in
            if let err = err {
                print("Failed to login user:", err)
                self?.errorMessage = "Failed to login user"
                return
            }
            
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            self?.loginStatus = true
        }
    }
}
