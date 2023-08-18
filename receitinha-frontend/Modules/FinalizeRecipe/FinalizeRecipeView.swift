//
//  FinalizeRecipeView.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 18/08/23.
//  
//

import SwiftUI

struct FinalizeRecipeView: View {

    @ObservedObject private var viewModel = FinalizeRecipeViewModel()
       
    var body: some View {
        VStack {
            Text("funcionando")
        }
    }

}

struct FinalizeRecipe_Previews: PreviewProvider {
    static var previews: some View {
        FinalizeRecipeView()
    }
}
