//
//  WelcomeView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 18/07/2023.
//

import SwiftUI

struct WelcomeView: View {
    @AppStorage("userType") var userType: String = "Parent"
    @AppStorage("appstate") var appstate: String = ""
    var body: some View {
        VStack {
        Text("Welcome")
                .font(.custom("Poppins-Bold", size: 24))
                .padding(.top, 70)
            Text("Click below to sign up as a parent or professional")
                .padding()
                .multilineTextAlignment(.center)
            
            VStack{
                Button(action: {
                    userType = "Parent"
                    appstate = AppState.login.rawValue
                })
                {
                    Text("Parent")
                        .foregroundColor(.white)
                        .font(.custom("Poppins-Regular", size: 16))
                        .frame(maxWidth: 183, maxHeight: 53)
                        .background(Color.primaryColor)
                        .cornerRadius(10)
                    
                }
                .padding(.vertical, 30)
                
                Button(action: {
                    userType = "Professional"
                    appstate = AppState.login.rawValue
                })
                {
                        Text("Professional")
                        .foregroundColor(.white)
                        .font(.custom("Poppins-Regular", size: 16))
                        .frame(maxWidth: 183, maxHeight: 53)
                        .background(Color.primaryColor)
                        .cornerRadius(10)
                    
                }
                .padding()
                Button(action: {
                    appstate = AppState.login.rawValue
                }){
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.black)
                            .font(.custom("Poppins-Regular", size: 12))
                        Text("Login")
                            .fontWeight(.bold)
                            .foregroundColor(Color.primaryColor)
                            .font(.custom("Poppins-Regular", size: 12))
                    }
                    .padding(.vertical)
                }
            }
            .padding(.bottom)
            
            Spacer()
        }.padding()
    }
    
    
    
    
    struct WelcomeView_Previews: PreviewProvider {
        static var previews: some View {
            WelcomeView()
        }
    }
}
