//
//  LoginViewModel.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 06/08/23.
//  
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class LoginViewModel: ObservableObject {
    @Published var example: String?
}