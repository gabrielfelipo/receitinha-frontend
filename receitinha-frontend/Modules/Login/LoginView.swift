//
//  LoginView.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 06/08/23.
//  
//

import SwiftUI

struct LoginView: View {

    @ObservedObject private var viewModel = LoginViewModel()
    @EnvironmentObject var coordinator: ViewCordinator
    @EnvironmentObject var loginManager: LoginManager
    
    @ViewBuilder
    private var forms: some View {
        
        Spacer()
            .frame(height: 88)
        
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
                             title: "Login"){
                viewModel.authenticate()
                coordinator.goToHome()
            }

            Spacer()
                .frame(height: 16)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(AssetColor.blue_100))
    }

}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
