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
    
    private var caller = APICaller()
    
    @Published var isSomethingWrong = false
    @Published var userId: String = UserDefaults.standard.string(forKey: "userId")!
    private var bag = Set<AnyCancellable>()
    
    func unlockAchievement(receitaId: String) async -> Result<UnlockAchievementResponse, APICallerError> {
        let recipeParams = URLQueryItem(name: "receitaId", value: receitaId)
        let userParams = URLQueryItem(name: "usuarioId", value: userId)
        
        var api = APIBuilder()
            .routeTo(.desbloquear_conquista)
            .build()
        api.append(queryItems: [recipeParams,userParams])
        
        let request = caller.createRequest(with: api, and: .get)
        let response = await caller.peform(request, expecting: UnlockAchievementResponse.self)
        return response
    }
}

struct UnlockAchievementResponse: Codable {
    
    let data: String
}
