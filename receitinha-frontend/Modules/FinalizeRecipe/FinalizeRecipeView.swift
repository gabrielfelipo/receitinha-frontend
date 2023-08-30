//
//  FinalizeRecipeView.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 18/08/23.
//  
//

import SwiftUI

struct FinalizeRecipeView: View {
    
    let receita: Receitas
    @ObservedObject private var viewModel = FinalizeRecipeViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            contentView
        }
        .background(Color(AssetColor.blue_100))
        .navigationBarBackButtonHidden()
    }
    
    private var contentView: some View {
        VStack {
            congratulations
            
            Spacer()
                .frame(height: 60)
            
            Image(AssetImage.cenourinha)
            
            reminderAndActionAfterEndRecipe
            
            Spacer()
            
            ReceitinhaButton(spacing: 16,
                             style: .primary,
                             title: "Finalizar Receita"){
                
                
                presentationMode.wrappedValue.dismiss()
                
            }
        }.task {
            let response = await viewModel.unlockAchievement(receitaId: receita.id)
            switch response {
            case .success(let receitas):
                viewModel.isSomethingWrong = false
            case .failure:
                viewModel.isSomethingWrong = true
            }
        }
    }
    
    private var congratulations: some View {
        Text("Parabéns")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.top, 40)
    }
    
    private var reminderAndActionAfterEndRecipe: some View {
        VStack(alignment: .center, spacing: 4) {
            Text("Você concluiu esta receita!")
                .font(.system(size: 22))
                .fontWeight(.bold)
            
            Text("Lembre-se de organizar a cozinha e aproveite sua comida!")
                .font(.system(size: 22))
                .multilineTextAlignment(.center)
        }
        .padding(.top, 60)
        .padding(.horizontal, 12)
        
    }
    
}

struct FinalizeRecipe_Previews: PreviewProvider {
    static var previews: some View {
        FinalizeRecipeView(receita:  Receitas(id: "1", titulo: "Banana pica", duracao: "1 minuto", descricao: "bananao", dificuldade: "dificil", ingredientes: ["1 colher", "1 banana"], passos: "corte banana", imagem: "a"))
    }
}
