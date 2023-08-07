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
            ZStack {
                Color(AssetColor.blue_100)
                cards
            }
            .background(.white)
            .navigationTitle(Text("Escolher Receita"))
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    private var cards: some View {
        ScrollView {
            ForEach(1...10, id: \.self){ _ in
                FoodCard(spacing: 16)
            }
        }
        .padding(.top, 16)
    }
}

struct ReceitasView_Previews: PreviewProvider {
    static var previews: some View {
        ReceitasView()
    }
}
