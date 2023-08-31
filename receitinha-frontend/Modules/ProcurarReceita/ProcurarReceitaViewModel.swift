//
//  ProcurarReceitaViewModel.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 04/08/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class ProcurarReceitaViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var receitas: [Receita] = []
    
    @Published var somethingGoWrong = false
    
    
    private let caller = APICaller()
    
    func fetchReceitasBy(_ name: String) async -> Result<ProcurarReceita, APICallerError > {
        let params = URLQueryItem(name: "nome", value: name)
                
        var api = APIBuilder().routeTo(.receitas_externas).build()
        api.append(queryItems: [params])
        let request = caller.createRequest(with: api, and: .get)
        
        let response = await caller.peform(request, expecting: ProcurarReceita.self)
        
        return response
    }
    
}
