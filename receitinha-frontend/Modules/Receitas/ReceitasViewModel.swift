//
//  ReceitasViewModel.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 04/08/23.
//  
//

import SwiftUI
import Combine

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class ReceitasViewModel: ObservableObject {
    
    @Published var receitas: [Receitas] = []
    
    @Published var somethingGoWrong = false
    
    @Published var isSomethingWrong = false
    private var url : URL = APIBuilder().routeTo(.receitas).build()
    
    private var bag = Set<AnyCancellable>()
    
    func getReceitas() async{
        var receitas_api = url
        
        URLSession
            .shared
            .dataTaskPublisher(for: receitas_api)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: GetReceitas.self, decoder: JSONDecoder())
            .sink { [weak self] response in
                switch response {
                case .failure:
                    self?.receitas = []
                    print("falhou")
                    self?.somethingGoWrong = true
                default:
                    self?.somethingGoWrong = false
                }
            } receiveValue: { [weak self] todasReceitas in
                self?.receitas = todasReceitas.data.receitas
            }
            .store(in: &bag)
    }
}
