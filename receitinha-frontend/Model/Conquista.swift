//
//  Conquista.swift
//  receitinha-frontend
//
//  Created by sml on 29/08/23.
//

import SwiftUI

struct Conquista: Identifiable, Decodable, Equatable {
    let id: String;
    let titulo: String;
    let imagemBloqueada: String;
    let imagemDesbloqueada: String;
    let receitaId: String;
}

struct GetConquista: Decodable {
    let data: ConquistaObject
}

struct ConquistaObject: Decodable {
    let conquista: Conquista
}

