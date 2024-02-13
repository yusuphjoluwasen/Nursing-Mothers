//
//  MainTabView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 05/08/2023.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var viewModel:ProfileViewModel = ProfileViewModel()
    @AppStorage("profile")
    private var profileData:Data = Data()
    var body: some View {
        TabView {
            
            SupportLibraryView()
                .tabItem {   //heart.text.square.fill
                    Image(systemName: "figure.and.child.holdinghands")
                        .foregroundColor(.black)
                    Text("Support")
                        .foregroundColor(.black)
                }
            
            MessagingForumView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Community")
                }
            
            NotificationView()
                .tabItem {
                    Image(systemName: "message.circle")
                    Text("Notification")
                }
            
            ProfessionalsView()
                .tabItem {
                    Image(systemName: "person.text.rectangle.fill")
                    Text("Proffesionals")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(Color.black)
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}




