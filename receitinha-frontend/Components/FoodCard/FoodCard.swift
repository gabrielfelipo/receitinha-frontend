//
//  FoodCard.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 07/08/23.
//

import SwiftUI

struct FoodCard: View {
    let receita: Receitas
    
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
            AsyncImage(url: URL(string: receita.imagem))
            { phase in switch phase { case .failure: Image("comida") .font(.largeTitle) case .success(let image): image .resizable() default: ProgressView() } } .frame(width: 144, height: 104) .clipShape(RoundedRectangle(cornerRadius: 16))
            details
            Spacer()
        }
        .padding(.leading, 8)
    }
    
    
    private var details: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(receita.titulo)
                .fontWeight(.bold)
                .font(.title3)
            
            VStack(alignment: .leading) {
                createDetailsText("Duração: \(receita.duracao)")
                createDetailsText("Dificuldade: \(receita.dificuldade)")
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
