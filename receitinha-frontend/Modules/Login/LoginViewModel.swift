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
    
    @Published var isSomethingWrong = false
    
    private var caller = APICaller()
    
    func authenticate() async -> Result<LoginResponseData, APICallerError> {
        let login =  Login(email: email, senha: senha)
        let api = APIBuilder().routeTo(.login).build()
        guard let jsonData = try? JSONEncoder().encode(login) else { return .failure(.errorInCall) }
        let request = caller.createRequest(with: api, and: .post, body: jsonData)
        let response = await caller.peform(request, expecting: LoginResponseData.self)
        return response
    }
}
