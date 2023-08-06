//
//  CadastroView.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 06/08/23.
//  
//

import SwiftUI

struct CadastroView: View {

    @ObservedObject private var viewModel = CadastroViewModel()
       
    var body: some View {
        ZStack {
            Color(AssetColor.blue_100)
            
            VStack {
                Image(AssetImage.cenourinha)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 140)
                
                ReceitinhaTextField(placeholder: "Nome",
                                    text: $viewModel.nome,
                                    spacing: 16)
                
                ReceitinhaTextField(placeholder: "Nome",
                                    text: $viewModel.nome,
                                    spacing: 16)
                
                ReceitinhaTextField(placeholder: "Nome",
                                    text: $viewModel.nome,
                                    spacing: 16)
                
            }
        }
    }

}

struct Cadastro_Previews: PreviewProvider {
    static var previews: some View {
        CadastroView()
    }
}
