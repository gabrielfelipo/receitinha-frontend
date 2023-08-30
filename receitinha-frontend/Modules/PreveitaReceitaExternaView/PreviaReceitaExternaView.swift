//
//  PreviaReceitaExternaView.swift
//  receitinha-frontend
//
//  Created by sml on 29/08/23.
//


import SwiftUI

struct PreviaReceitaExternaView: View {
    @ObservedObject private var viewModel = ProcurarReceitaExternaViewModel()
    @State var ingredientsList: [String] = []
    @State var passosList: [String] = []

    var receita: Receita
   

    var body: some View {
        VStack{
            ZStack(alignment: .leading) {
                Color(.white)
                Text(receita.titulo)
                    .bold()
                    .font(.title)
                    .padding(.leading, 16)
            }.frame(height: 48)
            ZStack {
                Color(AssetColor.blue_100)
                detalhesVStack
            }.ignoresSafeArea()
                .onAppear{
                    ingredientsList =  viewModel.separarIngredientes(receita.ingredientes)
                    passosList = viewModel.separarPassos(receita.passos)

                }
        }
    }
    
    private var detalhesVStack: some View {
        ScrollView{
            VStack(spacing: 24) {
                recipeDescription
                bar
                ingredientsTitle
                Spacer()
            }
            .padding(16)
        }
    }

    private var bar: some View {
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: 1)
    }
    
    private var recipeDescription: some View {
        VStack(spacing: 8 ) {
            Text("Passos")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading,.trailing], 8)

            passos
        }

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
    
    private var passos: some View {
        VStack(alignment: .leading) {
            ForEach(passosList, id: \.self) { passo in
                Text(" • " + passo)
                    .font(.system(size: 17))
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .padding([.leading,.trailing], 8)
            }
        }
    }
}

