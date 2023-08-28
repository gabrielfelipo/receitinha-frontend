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
            ZStack {
                Color("blue-100")
                
                List {
                    ForEach(viewModel.receitas, id: \.id) { receita in
                        VStackLayout(alignment: .center){
                            Text(receita.titulo)
                        }
                    }
                }.onChange(of: viewModel.searchText){ name in
                    viewModel.fetchReceitasBy(name)
                }
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
