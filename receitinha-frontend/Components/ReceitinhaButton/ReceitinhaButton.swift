//
//  ReceitinhaButton.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 03/08/23.
//

import SwiftUI

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
                .fontWeight(.bold)
        }
        .foregroundColor(style.model.textColor)
        .background(style.model.background)
        .cornerRadius(25)
    }
    
    private var leftArrow: some View {
        VStack {
   
        }
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
                         title: "opa",
                         userTap: {
            print("oi")
        })
    }
}
