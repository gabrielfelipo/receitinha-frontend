//
//  PreviaReceitaExternaViewModel.swift
//  receitinha-frontend
//
//  Created by sml on 29/08/23.
//

import SwiftUI

final class ProcurarReceitaExternaViewModel: ObservableObject {
    func separarIngredientes(_ ingredientes: String) -> [String] {
        return ingredientes.components(separatedBy: "|")
    }
    
    func separarPassos(_ passos: String) -> [String] {
        return passos.components(separatedBy: ".")
    }
}
