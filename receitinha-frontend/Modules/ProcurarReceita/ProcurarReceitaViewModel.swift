//
//  ProcurarReceitaViewModel.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 04/08/23.
//  
//

import SwiftUI
import Combine

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class ProcurarReceitaViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var receitas: [Receita] = []
    
    @Published var somethingGoWrong = false
    
    private var url: URL = APIBuilder()
                                .routeTo(.receitas_externas)
                                .build()
    
    
    private var bag = Set<AnyCancellable>()
    
    func fetchReceitasBy(_ name: String){
        let params = URLQueryItem(name: "nome", value: name)
        var receitas_externas_api = url
        receitas_externas_api.append(queryItems: [params])
        
        URLSession
            .shared
            .dataTaskPublisher(for: receitas_externas_api)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: ProcurarReceita.self, decoder: JSONDecoder())
            .sink { [weak self] response in
                switch response {
                case .failure:
                    self?.receitas = []
                    self?.somethingGoWrong = true
                default:
                    self?.somethingGoWrong = false
                }
            } receiveValue: { [weak self] receitasProcuradas in
                self?.receitas = receitasProcuradas.data.receitas
            }
            .store(in: &bag)
    }
    
}
