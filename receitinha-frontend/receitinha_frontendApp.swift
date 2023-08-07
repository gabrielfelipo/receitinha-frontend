//
//  receitinha_frontendApp.swift
//  receitinha-frontend
//
//  Created by gabrielfelipo on 03/08/23.
//

import SwiftUI

@main
struct receitinha_frontendApp: App {
    
    @ObservedObject var coordinator = ViewCordinator()
    @StateObject var loginManager = LoginManager()
    
    
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *){
                NavigationStack(path: $coordinator.path){
                    
                    if loginManager.isLoggedIn {
                        MainView()
                    } else {
                        
                        LandingPage()
                            .navigationDestination(for: Route.self){ destination in
                                switch destination {
                                case .login:
                                    LoginView()
                                case .cadastro:
                                    CadastroView()
                                case .tab:
                                    MainView()
                                        .navigationBarBackButtonHidden(true)
                                }
                        }
                    }
                }
                .environmentObject(coordinator)
                .environmentObject(loginManager)
            }
        }
    }
}
