//
//  LoginManager.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 07/08/23.
//

import Foundation


class LoginManager : ObservableObject {
    
    @Published var isLoggedIn = false
    
    init(){
        self.isLoggedIn = AuthManager.shared.isAuth
    }
    
    func login() {
        DispatchQueue.main.async {
            self.isLoggedIn = true
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            withAnimation {
//                self.isLoggedIn = true
//            }
//        }
    }
}
