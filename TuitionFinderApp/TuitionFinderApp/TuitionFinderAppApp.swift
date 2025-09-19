//
//  TuitionFinderAppApp.swift
//  TuitionFinderApp
//
//  Created by Hashani Ranawake on 2025-09-14.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn
import FirebaseFirestore
import FirebaseAuth
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TuitionFinderAppApp: App {
    @StateObject private var userSession = UserSession.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        // Configure Google Sign In
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: clientID)
    }
    var body: some Scene {
        WindowGroup {
            //ContentView()
            //WelcomeView()
            //LoginView()
            //SignUpView()
            //MainView()
            //ClassDetailsView()
            
            //HomeView()
            //TutorDashBoardView()

            TutorClassesView()

            //TutorClassesView()

            //AddClassView()
            //TutorSheduleView()
            //TutorProfileView()
            //TutorMainScreenView()
            //BioMetricLoginView()


            //AddReminderView()

          
            
            
            
            
            
            
            Group {
                if userSession.isAuthenticated {
                    MainView()
                } else {
                    LoginView()
                }
            }
            .environmentObject(userSession)
        }
    }
}
