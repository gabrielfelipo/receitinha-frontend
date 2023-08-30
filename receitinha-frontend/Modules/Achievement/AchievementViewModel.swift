//
//  AchievementViewModel.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 09/08/23.
//  
//

import SwiftUI
import Combine

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class AchievementViewModel: ObservableObject {
    
    private var caller = APICaller()

    @Published var isSomethingWrong = false
    @Published var conquistasIds: [String] = []
    @Published var conquistas: [Conquista] = []
    
    @Published var userId: String = UserDefaults.standard.string(forKey: "userId")!


    private var bag = Set<AnyCancellable>()

    @Published var achievements: [Achievement] = [
        Achievement(image: AssetImage.banana, name: "Mestre Banana", avaiable: .blocked),
        Achievement(image: AssetImage.banana_split, name: "Mestre Split", avaiable: .blocked),
        Achievement(image: AssetImage.burguer, name: "Mestre Burguer", avaiable: .blocked),
        Achievement(image: AssetImage.ice, name: "Mestre Ice", avaiable: .blocked),
        Achievement(image: AssetImage.cookies, name: "Mestre Cookie", avaiable: .blocked),
        Achievement(image: AssetImage.muffin, name: "Mestre Muffin", avaiable: .blocked)
    ]
    
    func getUser() async -> Result<GetUser, APICallerError> {
        var api = APIBuilder()
            .routeTo(.get_user)
            .build()
        api.append(path: userId)
        let request = caller.createRequest(with: api, and: .get)
        let response = await caller.peform(request, expecting: GetUser.self)
        return response
    }
    
    func getConquista(conquistaId: String) async -> Result<GetConquista, APICallerError>  {
        var api = APIBuilder()
            .routeTo(.get_conquista)
            .build()
        api.append(path: conquistaId)
        let request = caller.createRequest(with: api, and: .get)
        let response = await caller.peform(request, expecting: GetConquista.self)
        return response
    }
}
