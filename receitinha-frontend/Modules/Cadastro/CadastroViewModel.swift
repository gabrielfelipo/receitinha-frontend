//
//  CadastroViewModel.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 06/08/23.
//  
//

import SwiftUI
import Combine

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class CadastroViewModel: ObservableObject {
    
    @Published var nome: String = ""
    @Published var email: String = ""
    @Published var senha: String = ""
    
    private var caller = APICaller()
    
    @Published var isSomethingWrong = false
    @Published var isCadastroCompleto = false
    
    func cadastrarUsuario(){
        let usuario = Cadastro(nome: nome, email: email, senha: senha)
        let api = APIBuilder().routeTo(.cadastrar_usuario).build()
        
        guard let jsonData = try? JSONEncoder().encode(usuario) else { return }
    
        let request = caller.createRequest(with: api, and: .post, body: jsonData)
        
        Task {
            let response = await caller.peform(request)
        }
    
    }
}
