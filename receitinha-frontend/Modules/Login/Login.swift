//
//  Login.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 06/08/23.
//  
//

import SwiftUI

struct Login: Codable {
    let email: String
    let senha: String
}

struct LoginResponseData: Codable {
    
    let data: LoginResponse
}

struct LoginToken: Codable {
    let token: String
    let expiresIn: Int
}

struct LoginResponse: Codable {
    let token: LoginToken
    let id: String
}
