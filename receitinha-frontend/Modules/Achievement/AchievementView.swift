//
//  AchievementView.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 09/08/23.
//  
//

import SwiftUI

struct AchievementView: View {

    @ObservedObject private var viewModel = AchievementViewModel()
       
    var body: some View {
        NavigationView {
            ZStack {
                Color(AssetColor.blue_100)
                contentAchievement
            }
            .background(.white)
            .navigationTitle(Text("Conquistas"))
            .navigationBarTitleDisplayMode(.large)
        }.onChange(of: viewModel.conquistasIds, perform: { conquistasIds in
            Task{
                for id in conquistasIds {
                    let response = await viewModel.getConquista(conquistaId: id)
                    switch response {
                    case .success(let conquista):
                        print(conquista.data.conquista.titulo)
                    case .failure:
                        viewModel.isSomethingWrong = true
                    }
                }
            }

        })
        .task {
            print(viewModel.userId)
            let response = await viewModel.getUser()
            switch response {
            case .success(let user):
                viewModel.conquistasIds = user.data.usuario.conquistas
            case .failure:
                viewModel.isSomethingWrong = true
            }
        }
    }
    
    private var contentAchievement: some View {
        VStack(spacing: 24) {
            Image(AssetImage.trofeu)
            callActionToCook
            achievements
            Spacer()
        }
        .padding(.top, 32)
        .padding(.horizontal, 8)
    }
    
    private var achievements: some View {
        
        LazyVGrid(columns: columns, spacing: 24) {
            ForEach(viewModel.achievements, id: \.self){ achievement in
                AchievementCard(achievement: achievement)
            }
        }
    }
    
    private var callActionToCook: some View {

        Text("Cozinhe novas receitas para ganhar conquistas!")
            .font(.headline)
            .multilineTextAlignment(.center)
            .foregroundColor(Color(AssetColor.dark_gray))
            .padding(.horizontal, 24)
    }
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
}

struct Achievement_Previews: PreviewProvider {
    static var previews: some View {
        AchievementView()
    }
}
