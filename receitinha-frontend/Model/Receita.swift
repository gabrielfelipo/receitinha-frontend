//
//  Receita.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 06/08/23.
//

import Foundation


struct Receita: Identifiable, Codable {
    
    let id: String
    let titulo: String
    let passos: String
    let ingredientes: String
}
