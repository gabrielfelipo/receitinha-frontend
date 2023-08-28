//
//  ContentView.swift
//  receitinha-frontend
//
//  Created by gabrielfelipo on 03/08/23.
//

import SwiftUI

struct ReceitasView: View {
    
    @ObservedObject private var viewModel = ReceitasViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(AssetColor.blue_100)
                cards
            }
            .background(.white)
            .navigationTitle(Text("Escolher Receita"))
            .navigationBarTitleDisplayMode(.large)
        }.task {
            await viewModel.getReceitas()
        }
    }
    
    private var cards: some View {
        ScrollView {
            ForEach(viewModel.receitas, id: \.id){ receita in
                FoodCard(receita: receita, spacing: 16)
            }
            
            
        }
        .padding(.top, 16)
    }
}

struct ReceitasView_Previews: PreviewProvider {
    static var previews: some View {
        ReceitasView()
    }
}
