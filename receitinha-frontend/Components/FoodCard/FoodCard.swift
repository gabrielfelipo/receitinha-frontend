//
//  FoodCard.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 07/08/23.
//

import SwiftUI

struct FoodCard: View {
    
    let spacing: CGFloat
    
    var body: some View {
        
        HStack {
            Spacer()
                .frame(width: 16)
            card
            Spacer()
                .frame(width: 16)
        }
        .shadow(color: Color.black.opacity(0.35), radius: 3, x: 0, y: 3)
    }
    
    private var card: some View {
        HStack {
            imageAndDetails
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 120)
        .background(.white)
    
        .cornerRadius(8)
    }
    
    private var imageAndDetails: some View {
        HStack(spacing: 8) {
            Image("comida")
            details
            Spacer()
        }
        .padding(.leading, 8)
    }
    
    
    private var details: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Misto quente")
                .fontWeight(.bold)
                .font(.title3)
            
            VStack(alignment: .leading) {
                createDetailsText("Duração: 10 minutos")
                createDetailsText("Dificuldade: Fácil")
            }
            Spacer()
        }
        .padding(.top, 8)
        .frame(height: 120)
    }
    
    private func createDetailsText(_ text: String) -> some View {
        Text(text)
            .foregroundColor(Color(AssetColor.dark_gray))
            .fontWeight(.semibold)
            .font(.body)
        
    }
}
