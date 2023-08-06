//
//  LoginView.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 06/08/23.
//  
//

import SwiftUI

struct LandingPage: View {
       
    var body: some View {
        VStack {
            Color("blue-100")
            Image("cenourinha")
            
            Spacer()
                .frame(height: 200)
            
            ReceitinhaButton(spacing: 16,
                             style: .primary,
                             title: "Login"){
                print("tocou em login ")
            }
            
            ReceitinhaButton(spacing: 16,
                             style: .primary,
                             title: "Fazer conta"){
                print("fazer conta")
            }
        }
        .background(Color("blue-100"))
    }

}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
