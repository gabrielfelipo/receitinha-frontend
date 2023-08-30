//
//  Achievement.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 09/08/23.
//  
//

import SwiftUI

struct Achievement: Hashable {
    
    let image: String
    let name: String
    let avaiable: AchievementStatus

}


enum AchievementStatus {
    
    case blocked
    case completed
}
