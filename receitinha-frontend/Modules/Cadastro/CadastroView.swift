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
        Text(viewModel.example ?? "Hello World")
    }

}

struct Cadastro_Previews: PreviewProvider {
    static var previews: some View {
        CadastroView()
    }
}