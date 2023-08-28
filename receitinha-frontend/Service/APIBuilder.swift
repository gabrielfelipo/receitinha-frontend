//
//  APICaller.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 06/08/23.
//

import Foundation

enum EndPoint: String {
    
    case receitas_externas = "receitas-externas?"
    case cadastrar_usuario = "cadastrar-usuario"
    case receitas = "receitas"
}



class APIBuilder {
    
    private var url: URL?
    
    
    struct API_CONSTANT {
        static let adress = "http://localhost:3001"
    }
    
    func routeTo(_ endpoint: EndPoint) -> APIBuilder {
        self.url = URL(string: "\(API_CONSTANT.adress)/\(endpoint.rawValue)")
        return self
    }
        
    func build() -> URL {
        return self.url!
    }
}
