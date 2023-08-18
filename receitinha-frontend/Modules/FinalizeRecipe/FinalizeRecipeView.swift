//
//  FinalizeRecipeView.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 18/08/23.
//  
//

import SwiftUI

struct FinalizeRecipeView: View {

    @ObservedObject private var viewModel = FinalizeRecipeViewModel()
       
    var body: some View {
        ZStack {
            
            VStack {
                Text("Parabéns")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                Spacer()
                    .frame(height: 60)
                
                Image(AssetImage.cenourinha)
                
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
                
                Spacer()
                
                ReceitinhaButton(spacing: 16,
                                 style: .primary,
                                 title: "Finalizar Receita"){
                    print("oi")
                }
            }

        }
        .background(Color(AssetColor.blue_100))
    }

}

struct FinalizeRecipe_Previews: PreviewProvider {
    static var previews: some View {
        FinalizeRecipeView()
    }
}
