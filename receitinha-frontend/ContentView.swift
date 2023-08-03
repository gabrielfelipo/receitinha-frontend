//
//  ContentView.swift
//  receitinha-frontend
//
//  Created by gabrielfelipo on 03/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
        VStack {
            Spacer()
            
            ReceitinhaButton(spacing: 32,
                             style: .primary,
                             title: "Clica em mim"){
                print("oi")
            }
        }
        .background(.gray)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
