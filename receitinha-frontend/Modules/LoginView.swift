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
       
    var body: some View {
        Text(viewModel.example ?? "Hello World")
    }

}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}