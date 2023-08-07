//
//  ContentView.swift
//  receitinha-frontend
//
//  Created by gabrielfelipo on 03/08/23.
//

import SwiftUI

struct ReceitasView: View {
    
    @ObservedObject private var viewModel = ReceitasViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                
                ForEach(1...4, id: \.self){ _ in
                    FoodCard(spacing: 16)
                }
            }
            .background(.white)
            .navigationTitle(Text("Escolher Receita"))
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ReceitasView_Previews: PreviewProvider {
    static var previews: some View {
        ReceitasView()
    }
}
