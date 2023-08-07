//
//  AuthManager.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 06/08/23.
//

import Foundation


class AuthManager {
    
    static let shared = AuthManager()
    
    var isAuth: Bool {
        return UserDefaults.standard.object(forKey: "auth") != nil
    }
    
    // essa classe vai ser mudada consideravelmente,  pra utilizar token, refresh token e expiration date.
    
    private init(){}

    
    func authenticated(){
        UserDefaults.standard.setValue("auth", forKey: "auth")
    }
}
