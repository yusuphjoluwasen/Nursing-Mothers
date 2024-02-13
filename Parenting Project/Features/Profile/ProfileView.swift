//
//  ProfileView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 26/07/2023.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("name") var name: String = ""
    @AppStorage("email") var email: String = ""
    @AppStorage("appstate") var appstate: String = ""
    @State private var isPresenting = false
    @ObservedObject var viewModel:ProfileViewModel = ProfileViewModel()
    @State private var currentItem:ProfileItem?
    @State private var user:UserProfile?
    
    var body: some View {
        VStack{
            
            VStack {
                Text("My Profile")
                    .font(.custom("Poppins-Bold", size: 24))
                
                AsyncImage(url: URL(string:user?.profilepicture ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .cornerRadius(35)
                } placeholder: {
                    Image("userprofile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .cornerRadius(35)
                }
                .padding(.leading)
                
                Text(name)
                    .font(.custom("Poppins-Medium", size: 18))
                
                Text(verbatim:email)
                .font(.custom("Poppins-Light", size: 12))
                .padding(.bottom)
                
                Text(viewModel.user?.bio.capitalized ?? "")
            }
            .padding(.trailing)
            .padding(.leading)
            
            VStack{
                ScrollView(showsIndicators: false){
                    ForEach(profileItemList) { profile in
                        Button{
                             
                            if profile.title == "Log Out"{
                                appstate = AppState.login.rawValue
                            }else{
                                if profile.title == "My Favourites (Premium)" || profile.title == "Daily Notification (Premium)"{
                                    
                                }else{
                                    currentItem = profile
                                    isPresenting = true
                                }
                            }
                            
                        }
                    label:{
                        ProfileItemView(profile: profile)
                            .padding(.top, 10)
                    }
                    }
                }
            }
            .padding(.horizontal)
            
            
            Spacer()
        }
        .onAppear{
            viewModel.fetchProfile()
        }
        .onChange(of: viewModel.fetchData) { newValue in
            if newValue{
                name = viewModel.user?.name.capitalized ?? ""
                email = viewModel.user?.email.capitalized ?? ""
            }
        }
        .navigationDestination(isPresented: $isPresenting, destination: {
            if currentItem?.title == "My Upcoming Appointment"{
                MyAppointmentView()
            }else if currentItem?.title == "Leave Feedback"{
                FeedbackView()
            }else if currentItem?.title == "Report Abuse"{
                ReportView()
            }
        })
        
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ProfileItem:Identifiable {
    var id = UUID()
    let title: String
}

let profileItemList = [
    ProfileItem(title: "My Upcoming Appointment"),
    ProfileItem(title: "Leave Feedback"),
    ProfileItem(title: "Report Abuse"),
    ProfileItem(title: "Daily Dose"),
    ProfileItem(title: "Log Out"),
]

struct ProfileItemView: View{
    var profile:ProfileItem
    var body: some View{
        VStack{
            HStack{
                VStack{
                    Image("tab")
                }
                .frame(width: 44, height: 44)
                .background(Color.lightPrimaryColor)
                .cornerRadius(10)
                
                
                Text(profile.title)
                    .font(.custom("Poppins-Regular", size: 14))
                    .foregroundColor(.black)
                    .padding(.leading, 10)
                
                Spacer()
            }
            .padding(.leading, 10)
            .frame(width: .infinity, height: 64)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.borderColor, lineWidth: 0.5)
                    .frame(width: .infinity, height: 66)
            }
            
        }
    }
}
