//
//  ProcurarReceita.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 04/08/23.
//  
//

import SwiftUI

struct ProcurarReceita: Codable {
    
    let data: ReceitasProcuradas
}

struct ReceitasProcuradas: Codable {
    
    let receitas: [Receita]
    
}
