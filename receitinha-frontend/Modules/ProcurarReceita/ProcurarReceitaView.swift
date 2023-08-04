//
//  ProcurarReceitaView.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 04/08/23.
//  
//

import SwiftUI

struct ProcurarReceitaView: View {

    @ObservedObject private var viewModel = ProcurarReceitaViewModel()
       
    var body: some View {
        Text(viewModel.example ?? "Hello World")
    }

}

struct ProcurarReceita_Previews: PreviewProvider {
    static var previews: some View {
        ProcurarReceitaView()
    }
}