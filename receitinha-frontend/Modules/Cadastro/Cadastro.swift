//
//  Cadastro.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 06/08/23.
//  
//

import SwiftUI

struct CadastroResponseData: Codable {
    let data: UsuarioData
}

struct UsuarioData: Codable {
    let usuario: UsuarioCadastrado
}

struct UsuarioCadastrado: Codable {
    let nome: String
    let email: String
}

struct Cadastro: Codable {
    
    let nome: String
    let email: String
    let senha: String
    
}
