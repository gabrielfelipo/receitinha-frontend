//
//  LoginView.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 06/08/23.
//  
//

import SwiftUI

struct LandingPage: View {
    
    @EnvironmentObject var coordinator: ViewCordinator
       
    var body: some View {
        VStack {
            Color(AssetColor.blue_100)
            Image(AssetImage.cenourinha)
            
            Spacer()
                .frame(height: 200)
            
            ReceitinhaButton(spacing: 16,
                             style: .primary,
                             title: LabelContent.LOGIN_BUTTON){
                coordinator.push(view: .login)
            }
            
            ReceitinhaButton(spacing: 16,
                             style: .primary,
                             title: LabelContent.CADASTRO_BUTTON){
                coordinator.push(view: .cadastro)
            }
        }
        .background(Color(AssetColor.blue_100))
    }

}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
