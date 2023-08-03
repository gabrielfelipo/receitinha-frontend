//
//  ReceitinhaButton.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 03/08/23.
//

import SwiftUI

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


struct ReceitinhaButtonViewModel {
    
    let background: Color
    let textColor: Color
}

struct ReceitinhaButton: View {
    
    let spacing: CGFloat
    let style: ReceitinhaButtonType
    let title: String
    
    var userTap: (() -> ())
    
    private var button: some View {
        Button {
            userTap()
        } label: {
            Text(title)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.all, 17)
  
        }
        .foregroundColor(style.model.textColor)
        .background(style.model.background)
        .cornerRadius(25)
    }

    
    var body: some View {
        
        HStack {
            Spacer()
                .frame(width: spacing)
            button
            Spacer()
                .frame(width: spacing)
        }
    }
}

struct ReceitinhaButton_Previews: PreviewProvider {
    static var previews: some View {
        ReceitinhaButton(spacing: 32,
                         style: .primary,
                         title: "Testando"){
            print("oi")
        }
    }
}
