//
//  MainView.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 04/08/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
            AchievementView()
                .tabItem {
                    Label("Conquistas", systemImage: "rosette")
                }
            
            
            ReceitasView()
                .tabItem {
                    Label("Receitas", systemImage: "fork.knife")
                }
            
            ProcurarReceitaView()
                .tabItem {
                    Label("Procurar", systemImage: "magnifyingglass")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
