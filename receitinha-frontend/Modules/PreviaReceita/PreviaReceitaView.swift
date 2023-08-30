//
//  PreviaReceitaView.swift
//  receitinha-frontend
//
//  Created by gabrielfelipo on 09/08/23.
//

import SwiftUI

struct PreviaReceitaView: View {
    var ingredientsList = ["colher", "pao", "faca"]
    
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
            }.ignoresSafeArea()
            //            .navigationTitle("Banana com Nescau")
        }
    }
    
    private var detalhesVStack: some View {
        ScrollView{
            VStack(spacing: 24) {
                imageFood
                HStack(spacing: 0) {
                    timeDetailsCard
                    dificultDetailsCard
                }
                bar
                recipeDescription
                bar
                ingredientsTitle
                Spacer()
            }
            .padding(16)
        }
    }
    
    private var imageFood: some View {
        Image("comida")
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
    
    private var timeDetailsCard: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 163, height: 140)
                .padding([.leading,.trailing], 8)
                .foregroundColor(Color(AssetColor.blue_details))
                .shadow(color: .gray, radius: 3, y: 2)
            
            timeDetails
            
        }
    }
    
    private var dificultDetailsCard: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 163, height: 140)
                .padding([.leading,.trailing], 8)
                .foregroundColor(Color(AssetColor.blue_details))
                .shadow(color: .gray, radius: 3, y: 2)
            
            dificultDetails
            
        }
    }
    
    private var dificultDetails: some View {
        VStack{
            Image("dificult")
                .resizable()
                .frame(width: 67,height: 51)
                .foregroundColor(Color(red: 0.11, green: 0.29, blue: 0.40, opacity: 1.00))
                .bold()
            
            Text("Dificuldade")
            
            Text("Médio")
                .bold()
        }
    }
    
    private var timeDetails: some View {
        VStack{
            Image(systemName: "alarm")
                .resizable()
                .frame(width: 47,height: 52)
                .foregroundColor(Color(red: 0.11, green: 0.29, blue: 0.40, opacity: 1.00))
                .bold()
            
            Text("Duração")
            
            Text("10 minutos")
                .bold()
        }
    }
    
    private var bar: some View {
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: 1)
    }
    
    private var recipeDescription: some View {
        Text("Essa é uma receita de uma deliciosa banana com leite em pó, Nescau e farinha láctea. Um lanche prático, rápido e muito divertido de fazer!! ")
    }
    
    private var ingredientsTitle: some View {
        VStack(spacing: 8 ) {
            Text("Ingredientes")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading,.trailing], 8)
            
            ingredients
        }
    }
    
    private var ingredients: some View {
        VStack(alignment: .leading) {
            ForEach(ingredientsList, id: \.self) { ingredient in
                Text(" • " + ingredient)
                    .font(.system(size: 17))
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .padding([.leading,.trailing], 8)
            }
        }
    }
}

struct PreviaReceitaView_Previews: PreviewProvider {
    static var previews: some View {
        PreviaReceitaView()
    }
}
