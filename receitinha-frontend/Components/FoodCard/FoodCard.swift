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
            
            Spacer()
            
            VStack {
                Text("titulo")
                Text("subtitulo")
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(.yellow)
            
            Spacer()
        }
        .background(.green)
    }
    
    var body: some View {
        
        HStack {
        
            HStack {
                
                Spacer()
                    .frame(width: spacing)
        
                imageAndDetails
                
                Spacer()
                    .frame(width: spacing)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 120)
        .background(.blue)
    }
}
