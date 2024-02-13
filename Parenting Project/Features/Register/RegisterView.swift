//
//  RegisterView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 18/07/2023.
//

import SwiftUI

struct RegisterView: View {
    @AppStorage("userType") var userType: String = "Parent"
    @AppStorage("name") var name: String = ""
    @AppStorage("email") var email: String = ""
    @AppStorage("appstate") var appstate: String = ""
    @State var password = ""
    @State var jobtitle = ""
    @State var bio = ""
    @State var image: UIImage?
    @State var toggleImagePicker = false
    @State private var isPresenting = false
    
    @ObservedObject var viewModel:RegisterViewModel = RegisterViewModel()
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.custom("Poppins-Bold", size: 24))
            
            Button(action: {
                toggleImagePicker.toggle()
            }){
                VStack{
                    if let image = self.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .cornerRadius(35)
                    } else {
                        Image("userprofile")
                            .font(.system(size:70))
                            .imageScale(.large)
                            .padding()
                            .foregroundColor(Color(.label))
                    }
                }
               
            }
            
            Group {
                
               
                VStack{
                    TextField("Name", text: $name)
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
                
                VStack{
                    TextField("Profession (HCP only to complete)", text: $jobtitle)
                        .frame(height:45)
                        .autocapitalization(.none)
                        .padding(.horizontal)
                }
                .frame(height:50)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.borderColor, lineWidth: 1)
                        .frame(width: .infinity, height: 50)
                }
               
                VStack{
                    TextField("Bio", text: $bio)
                        .frame(height:65)
                        .keyboardType(.alphabet)
                        .autocapitalization(.none)
                        .padding(.horizontal)
                }
                .frame(height:70)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.borderColor, lineWidth: 1)
                        .frame(width: .infinity, height: 70)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(Color.white)
            
            Button(action: {
               isPresenting = true
            }) {
            
                HStack{
                    Text("By Clicking on Signup, You agree to our")
                        .foregroundColor(.black)
                        .font(.custom("Poppins-Regular", size: 12))
                    
                    Text("privacy policy")
                        .foregroundColor(.black)
                        .font(.custom("Poppins-Regular", size: 12))
                        .underline()
                    
                }
            }
            .padding(.top)
            
            Button(action: {
              create()
            }) {
            
                    Text("Sign Up")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.custom("Poppins-Regular", size: 12))
            
                .frame(maxWidth: .infinity, minHeight: 53)
                .background(Color.primaryColor)
                .cornerRadius(10)
            
            }.padding()
            
            Button(action: {
                appstate = AppState.login.rawValue
            }) {
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(.black)
                        .font(.custom("Poppins-Regular", size: 12))
                    Text("Login")
                        .foregroundColor(Color.primaryColor)
                        .font(.custom("Poppins-Regular", size: 12))
                }
            }
            
            Text(viewModel.errorMessage)
                .foregroundColor(Color.red)
                .font(.custom("Poppins-Regular", size: 12))
                .padding(.top, 15)
            
                        Spacer()
        }
        .fullScreenCover(isPresented: $toggleImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
                .ignoresSafeArea()
        }
        .navigationDestination(isPresented: $isPresenting, destination: {
            PrivacyPolicyView()
        })
        .onChange(of: viewModel.signUpStatus) { newValue in
            //if created succesfully, leave the page
            if newValue{
                appstate = AppState.home.rawValue
            }
        }
    }
    
    func create(){
        viewModel.createNewAccount(model: RegisterModel(name: name, jobtitle: jobtitle, email: email, password: password, bio: bio, image: image, userType: userType))
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
