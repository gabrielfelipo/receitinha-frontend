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
                        VStackLayout(alignment: .center) {
                            NavigationLink(destination: PreviaReceitaExternaView(receita: Receita(id: receita.id, titulo: receita.titulo, passos: receita.passos, ingredientes: receita.ingredientes))) {
                                               Text(receita.titulo)
                                            }
                            
                        }
                    }
                }.onChange(of: viewModel.searchText){ name in
                    Task {
                        let response = await viewModel.fetchReceitasBy(name)
                        
                        switch response {
                        case .success(let receitas):
                            viewModel.receitas = receitas.data.receitas
                        case .failure:
                            print("deu ruim nas receitas")
                        }
                    }
                    
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
