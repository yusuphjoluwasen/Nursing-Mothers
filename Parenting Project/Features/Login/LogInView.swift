//
//  LogInView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 18/07/2023.
//

import SwiftUI

struct LogInView: View {
    
    @State var email = ""
    @State var password = ""
    @AppStorage("appstate") var appstate: String = ""
    @ObservedObject var viewModel:LoginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.custom("Poppins-Bold", size: 24))
                .padding(.bottom, 80)
                .padding(.top)
            
            Group {
                VStack{
                    TextField("Email", text: $email)
                        .frame(height:45)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.horizontal)
                }
                .frame(height:50)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.borderColor, lineWidth: 1)
                        .frame(width: .infinity, height: 50)
                }
                .padding(.bottom)
                
                VStack{
                    SecureField("Password", text: $password)
                        .frame(height:45)
                        .padding(.horizontal)
                        .autocapitalization(.none)
                        
                }
                .frame(height:50)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.borderColor, lineWidth: 1)
                        .frame(width: .infinity, height: 50)
                }
                .padding(.bottom)
                   
               
            }
           
            .background(Color.white)
            
            Button(action: {
                viewModel.loginUser(model: LoginModel(email: email, password: password))
            }) {
                HStack {
                    Text("Sign in")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.custom("Poppins-Regular", size: 12))
                }
                .frame(maxWidth: .infinity, maxHeight: 53)
                .background(Color.primaryColor)
                .cornerRadius(10)
            }
            
            Button(action: {
                appstate = AppState.register.rawValue
            }) {
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.black)
                        .font(.custom("Poppins-Regular", size: 12))
                    Text("Sign up")
                        .foregroundColor(Color.primaryColor)
                        .font(.custom("Poppins-Regular", size: 12))
                }
                .padding(.top)
            }
            
            Text(viewModel.errorMessage)
                .foregroundColor(Color.red)
                .font(.custom("Poppins-Regular", size: 12))
                .padding(.top, 15)
            
            
            Spacer()
        }
        .padding(20)
        .onChange(of: viewModel.loginStatus) { newValue in
            //if created succesfully, leave the page
            if newValue{
                appstate = AppState.home.rawValue
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
