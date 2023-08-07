//
//  LoginViewModel.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 06/08/23.
//  
//

import SwiftUI

enum LoginError: Error {
    
    case authentication
}


// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var senha: String = ""
    
    func authenticate() -> Result<Login, LoginError> {
        let user = Login(email: "alex123@gmail.com", senha: "1234")
        return .success(user)
    }
}
