//
//  FoodCard.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 07/08/23.
//

import SwiftUI

struct FoodCard: View {
    
    let spacing: CGFloat
    
    var imageAndDetails: some View {
        HStack(spacing: 8) {
            
            Image("comida")
            
            VStack(alignment: .leading, spacing: 8) {
                

                Text("Misto quente")
                
                VStack(alignment: .leading) {
                    Text("Duração: 10 minutos")
                    Text("Dificuldade: Fácil")
                }
                
                Spacer()
     
            }
            .padding(.top, 8)
            .frame(height: 120)

            Spacer()
        }
        .padding(.leading, 8)
    }
    
    var body: some View {
        
        HStack {
            imageAndDetails
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 120)
        .background(.white)
        .cornerRadius(8)
    }
}
