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
                                
    @Published var somethingGoWrong = false
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
    
    func getUser() async {
        var user_api = urlUser
        user_api.append(path: userId)
        URLSession
            .shared
            .dataTaskPublisher(for: user_api)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: GetUser.self, decoder: JSONDecoder())
            .sink { [weak self] response in
                switch response {
                case .failure:
                    self?.conquistasIds = []
                    print(response)
                    self?.somethingGoWrong = true
                default:
                    self?.somethingGoWrong = false
                }
            } receiveValue: { [weak self] usuario in
                self?.conquistasIds = usuario.data.usuario.conquistas
            }
            .store(in: &bag)
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
                    self?.somethingGoWrong = true
                default:
                    self?.somethingGoWrong = false
                }
            } receiveValue: { [weak self] conquista in
                self?.conquistas.append(conquista.data.conquista)
            }
            .store(in: &bag)
    }
}
