//
//  AchievementViewModel.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 09/08/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class AchievementViewModel: ObservableObject {
    
//    @Published var
    
    @Published var achievements: [Achievement] = [
        Achievement(image: AssetImage.banana, name: "Mestre Banana", avaiable: .completed),
        Achievement(image: AssetImage.banana_split, name: "Mestre Split", avaiable: .blocked),
        Achievement(image: AssetImage.burguer, name: "Mestre Burguer", avaiable: .blocked),
        Achievement(image: AssetImage.ice, name: "Mestre Ice", avaiable: .blocked),
        Achievement(image: AssetImage.cookies, name: "Mestre Cookie", avaiable: .blocked),
        Achievement(image: AssetImage.muffin, name: "Mestre Muffin", avaiable: .blocked)
    ]
}
