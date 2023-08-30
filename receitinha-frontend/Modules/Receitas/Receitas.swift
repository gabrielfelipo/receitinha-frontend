//
//  Receitas.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 04/08/23.
//  
//

import SwiftUI

struct Receitas: Identifiable, Codable, Equatable {
    let id: String;
    let titulo: String;
    let duracao: String;
    let descricao: String;
    let dificuldade: String;
    let ingredientes: [String];
    let passos: String;
    let imagem: String;
}

struct GetReceitas: Codable {
    
    let data: ReceitasInternas
}

struct ReceitasInternas: Codable {
    
    let receitas: [Receitas]
    
}
