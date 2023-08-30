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
        }
        .task {
//            await viewModel.getReceitas()
            let response = await viewModel.getRecipes()
            switch response {
            case .success(let receitas):
                viewModel.receitas = receitas.data.receitas
                viewModel.isSomethingWrong = false
            case .failure:
                viewModel.isSomethingWrong = true
            }
        }
    }
    
    private var cards: some View {
        ScrollView {
            ForEach(viewModel.receitas, id: \.id){ receita in
                NavigationLink(destination: PreviaReceitaView(receita: receita)) {
                    FoodCard(receita: receita, spacing: 16)
                }
            }
//            NavigationLink(destination: PreviaReceitaView(receita: Receitas(id: "1", titulo: "Banana pica", duracao: "1 minuto", descricao: "bananao", dificuldade: "dificil", ingredientes: ["1 colher", "1 banana"], passos: "corte banana", imagem: "a"))){
//
//                FoodCard(receita: Receitas(id: "1", titulo: "Banana pica", duracao: "1 minuto", descricao: "bananao", dificuldade: "dificil", ingredientes: ["1 colher", "1 banana"], passos: "corte banana", imagem: "a"), spacing: 16)
//            }
      
        }
        .padding(.top, 16)
    }
}

struct ReceitasView_Previews: PreviewProvider {
    static var previews: some View {
        ReceitasView()
    }
}
