//
//  Parenting_ProjectApp.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 17/07/2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
    FirebaseApp.configure()
    
    return true
  }
}

@main struct Parenting_ProjectApp: App {
    // register app delegate for Firebase setup
     @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


