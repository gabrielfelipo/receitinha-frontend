//
//  AchievementCard.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 09/08/23.
//

import SwiftUI

struct AchievementCard: View {
    
    let achievement: Achievement
    
    private var achievementText: Text {
        Text(achievement.avaiable == .blocked ? "Bloqueado" : achievement.name)
            .foregroundColor(Color(AssetColor.gray_500))
            .font(.caption)
            .fontWeight(.bold)
    }
    
    var body: some View {
        
        VStack(spacing: 8){
            Image(achievement.image)
            achievementText
        }
    }
}
