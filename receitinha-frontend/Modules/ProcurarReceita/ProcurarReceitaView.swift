//
//  ProcurarReceitaView.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 04/08/23.
//  
//

import SwiftUI

struct ProcurarReceitaView: View {

    @ObservedObject private var viewModel = ProcurarReceitaViewModel()
           
    var body: some View {
        NavigationView {
            VStack {
                Color("blue-100")
                
            }
            .background(.white)
            .navigationTitle(Text("Procurar Receita"))
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $viewModel.searchText)
        }
    }

}

struct ProcurarReceita_Previews: PreviewProvider {
    static var previews: some View {
        ProcurarReceitaView()
    }
}
