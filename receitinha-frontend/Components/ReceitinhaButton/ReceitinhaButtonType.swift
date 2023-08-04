//
//  ReceitinhaButtonType.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 03/08/23.
//

import Foundation

enum ReceitinhaButtonType {
    case primary
    case secondary
    
    var model: ReceitinhaButtonViewModel {
        switch self {
        case .primary:
            return ReceitinhaButtonViewModel(background: .blue,
                                             textColor: .white)
            
        case .secondary:
            return ReceitinhaButtonViewModel(background: .white,
                                             textColor: .blue)
        }
    }
}
