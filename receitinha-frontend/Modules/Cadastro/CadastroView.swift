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
    @EnvironmentObject var coordinator: ViewCordinator
    
    
    @ViewBuilder
    private var forms: some View {
        
        Spacer()
            .frame(height: 88)
        ReceitinhaTextField(placeholder: "Nome",
                            text: $viewModel.nome,
                            style: .normal,
                            spacing: 16)
        
        ReceitinhaTextField(placeholder: "Email",
                            text: $viewModel.email,
                            style: .normal,
                            spacing: 16)
        
        ReceitinhaTextField(placeholder: "Senha",
                            text: $viewModel.senha,
                            style: .secure,
                            spacing: 16)
        Spacer()
    }
       
    var body: some View {
        
        VStack {
            
            Spacer()
                .frame(height: 64)
            Image(AssetImage.cenourinha)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 140)
            
            forms
            
            ReceitinhaButton(spacing: 16,
                             style: .primary,
                             title: "Cadastrar"){
                
                Task {
                    let response = await viewModel.cadastrarUsuario()
                    switch response {
                    case .success:
                        coordinator.pop()
                    case .failure:
                        viewModel.isSomethingWrong = true
                    }
                }
            }
            
            Spacer()
                .frame(height: 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(AssetColor.blue_100))
        .alert("Problema no cadastro",
               isPresented: $viewModel.isSomethingWrong){}
    }
}

struct Cadastro_Previews: PreviewProvider {
    static var previews: some View {
        CadastroView()
    }
}
