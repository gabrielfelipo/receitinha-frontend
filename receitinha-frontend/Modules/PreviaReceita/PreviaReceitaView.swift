//
//  PreviaReceitaView.swift
//  receitinha-frontend
//
//  Created by gabrielfelipo on 09/08/23.
//

import SwiftUI

struct PreviaReceitaView: View {
    var body: some View {
        VStack{
            ZStack(alignment: .leading) {
                Color(.white)
                Text("Banana com Nescau")
                    .bold()
                    .font(.title)
                    .padding(.leading, 16)
            }.frame(height: 48)
            ZStack {
                Color(AssetColor.blue_100)
                detalhesVStack
            }
//            .navigationTitle("Banana com Nescau")
        }
    }
    
    private var detalhesVStack: some View {
        ScrollView{
            VStack(spacing: 24) {
                imageFood
                HStack(spacing: 0) {
                    detailsCard
                    detailsCard
                }
                bar
                recipeDescription
                Spacer()
            }
            .padding(16)
        }
    }
    
    private var imageFood: some View {
        Image("muffin")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 200)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray, lineWidth: 1)
            )
            .padding([.leading,.trailing], 8)
    }
    
    private var detailsCard: some View {
        RoundedRectangle(cornerRadius: 8)
            .frame(width: 163, height: 140)
            .padding([.leading,.trailing], 8)
            .foregroundColor(Color(AssetColor.blue_details))
            .shadow(color: .gray, radius: 3, y: 2)
    }
    
    private var bar: some View {
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: 1)
    }
    
    private var recipeDescription: some View {
        Text("Essa é uma receita de uma deliciosa banana com leite em pó, Nescau e farinha láctea. Um lanche prático, rápido e muito divertido de fazer!! ")
    }
}

struct PreviaReceitaView_Previews: PreviewProvider {
    static var previews: some View {
        PreviaReceitaView()
    }
}
