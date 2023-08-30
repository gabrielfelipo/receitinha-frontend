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
    
    private var urlUser: URL = APIBuilder()
                                .routeTo(.get_user)
                                .build()
    private var urlConquista: URL = APIBuilder()
                                .routeTo(.get_conquista)
                                .build()
    private var caller = APICaller()

    @Published var isSomethingWrong = false
    @Published var conquistasIds: [String] = []
    @Published var conquistas: [Conquista] = []
    
    @Published var userId = "64e2e06133fcc642d7611d14"

    private var bag = Set<AnyCancellable>()

    @Published var achievements: [Achievement] = [
        Achievement(image: AssetImage.banana, name: "Mestre Banana", avaiable: .completed),
        Achievement(image: AssetImage.banana_split, name: "Mestre Split", avaiable: .blocked),
        Achievement(image: AssetImage.burguer, name: "Mestre Burguer", avaiable: .completed),
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
    
    func getConquista(conquistaId: String) async {
        var user_api = urlConquista
        user_api.append(path: conquistaId)
        
        URLSession
            .shared
            .dataTaskPublisher(for: user_api)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: GetConquista.self, decoder: JSONDecoder())
            .sink { [weak self] response in
                switch response {
                case .failure:
                    print(response)
                    self?.isSomethingWrong = true
                default:
                    self?.isSomethingWrong = false
                }
            } receiveValue: { [weak self] conquista in
                self?.conquistas.append(conquista.data.conquista)
            }
            .store(in: &bag)
    }
}
