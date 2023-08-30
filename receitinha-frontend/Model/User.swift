//
//  User.swift
//  receitinha-frontend
//
//  Created by sml on 29/08/23.
//

import SwiftUI

struct GetUser: Codable {
    let data: Usuario
}

struct Usuario: Codable {
    let usuario: User
}
struct User: Identifiable, Codable, Equatable {
    let id: String
    let nome: String
    let email: String
    let conquistas: [String]
}
