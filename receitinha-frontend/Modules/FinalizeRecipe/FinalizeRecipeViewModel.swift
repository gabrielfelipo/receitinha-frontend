//
//  FinalizeRecipeViewModel.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 18/08/23.
//  
//

import SwiftUI
import Combine

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class FinalizeRecipeViewModel: ObservableObject {
    @Published var example: String?
    
    private var caller = APICaller()
    
    @Published var isSomethingWrong = false
    private var url : URL = APIBuilder().routeTo(.receitas).build()
    
    private var bag = Set<AnyCancellable>()
    
    func getRecipes() async -> Result<GetReceitas, APICallerError> {
        var api = APIBuilder()
            .routeTo(.receitas)
            .build()
        let request = caller.createRequest(with: api, and: .get)
        let response = await caller.peform(request, expecting: GetReceitas.self)
        return response
    }
}
