//
//  ProcurarReceita.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 04/08/23.
//  
//

import SwiftUI

struct ProcurarReceita: Decodable {
    
    let data: ReceitasProcuradas
}

struct ReceitasProcuradas: Decodable {
    
    let receitas: [Receita]
    
}
