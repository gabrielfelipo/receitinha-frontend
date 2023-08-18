//
//  FinalizeRecipeViewModel.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 18/08/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class FinalizeRecipeViewModel: ObservableObject {
    @Published var example: String?
}