//
//  User.swift
//  receitinha-frontend
//
//  Created by sml on 29/08/23.
//

import SwiftUI

struct User: Identifiable, Decodable, Equatable {
    let id: String;
    let nome: String;
    let email: String;
    let conquistas: [String];
}

struct GetUser: Decodable {
    let data: Usuario
}

struct Usuario: Decodable {
    let usuario: User
}
