//
//  AchievementCard.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 09/08/23.
//

import SwiftUI

struct AchievementCard: View {
    
    let achievement: Achievement
    
    var body: some View {

        VStack(spacing: 8){
            Image(achievement.image)
            achievementText
        }
    }
    
    private var achievementText: Text {
        Text(achievement.avaiable == .blocked ? "Bloqueado" : achievement.name)
            .foregroundColor(textColor)
            .font(.caption)
            .fontWeight(.bold)
    }
    
    private var textColor: Color {
        achievement.avaiable == .blocked ? Color(AssetColor.gray_500) : Color(AssetColor.yellow_600)
    }
}
