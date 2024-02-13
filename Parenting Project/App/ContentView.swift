//
//  ContentView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 17/07/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("appstate") var appstate: String = "onboarding"
    var body: some View {
        NavigationStack{
            VStack {
                if appstate == AppState.onboarding.rawValue{
                    OnboardingView()
                }else if appstate == AppState.welcome.rawValue{
                    WelcomeView()
                }else if appstate == AppState.login.rawValue{
                    LogInView()
                }
                else if appstate == AppState.register.rawValue{
                    RegisterView()
                }else if appstate == AppState.home.rawValue{
                  MainTabView()
                }
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}


enum AppState:String{
    case onboarding
    case welcome
    case home
    case login
    case register
}

