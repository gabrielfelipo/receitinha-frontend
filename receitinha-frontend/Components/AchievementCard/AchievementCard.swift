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
    }
    
    var body: some View {
        
        VStack(spacing: 8){
            Image(achievement.image)
            achievementText
        }
    }
}

//struct AchievementCard_Previews: PreviewProvider {
//    static var previews: some View {
//        AchievementCard()
//    }
//}
