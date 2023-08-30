//
//  PreviaReceitaView.swift
//  receitinha-frontend
//
//  Created by gabrielfelipo on 09/08/23.
//

import SwiftUI

struct PreviaReceitaView: View {
    
    let receita : Receitas
    @Environment(\.presentationMode) var presentationMode
    @State var root = false
    @EnvironmentObject var coordinator: ViewCordinator
    
    var body: some View {
        ZStack {
            Color(AssetColor.blue_100)
            //                    .ignoresSafeArea()
            detalhesVStack
        }
        .onAppear(){
            if root == true {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .background(ignoresSafeAreaEdges: .top)
        .background(Color(AssetColor.blue_100))
        .navigationTitle(receita.titulo).font(.title)
        .navigationBarTitleDisplayMode(.large)
    }
    
    private var detalhesVStack: some View {
        ScrollView{
            VStack(spacing: 24) {
                imageFood
                HStack(spacing: 0) {
                    timeDetailsCard
                    dificultDetailsCard
                }
                bar
                recipeDescription
                bar
                ingredientsTitle
                buttonToFinalize
                
                Spacer()
            }
            .padding(16)
        }
    }
    
    private var buttonToFinalize: some View {
        NavigationLink(destination: FinalizeRecipeView(receita: receita)) {
            ZStack {
                Rectangle()
                    .frame(height: 58)
                    .foregroundColor(.blue)
                    .cornerRadius(25)
                    .onAppear(){
                        root = true
                    }
                
                Text("Iniciar a receita")
                    .font(.system(size: 17))
                    .bold()
                    .foregroundColor(.white)
            }
        }
    }
    
    private var imageFood: some View {
        
        AsyncImage(url: URL(string: receita.imagem))
        { phase in switch phase { case .failure: imageDefault  case .success(let image): image
            .resizable()
            .aspectRatio(contentMode: .fill)
            default: ProgressView() } }
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        
//        Image(receita.imagem)
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(height: 200)
//            .cornerRadius(16)
//            .overlay(
//                RoundedRectangle(cornerRadius: 16)
//                    .stroke(.gray, lineWidth: 1)
//            )
//            .padding([.leading,.trailing], 8)
    }
    
    private var imageDefault: some View {
        Image("comida")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .padding([.leading,.trailing], 8)
    }
    
    private var timeDetailsCard: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 163, height: 140)
                .padding([.leading,.trailing], 8)
                .foregroundColor(Color(AssetColor.blue_details))
                .shadow(color: .gray, radius: 3, y: 2)
            
            timeDetails
            
        }
    }
    
    private var dificultDetailsCard: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 163, height: 140)
                .padding([.leading,.trailing], 8)
                .foregroundColor(Color(AssetColor.blue_details))
                .shadow(color: .gray, radius: 3, y: 2)
            
            dificultDetails
            
        }
    }
    
    private var dificultDetails: some View {
        VStack{
            Image("dificult")
                .resizable()
                .frame(width: 67,height: 51)
            
            Text("Dificuldade")
                .foregroundColor(Color(red: 0.11, green: 0.29, blue: 0.40, opacity: 1.00))
                .font(.system(size: 17))
            
            Text(receita.dificuldade)
                .foregroundColor(Color(red: 0.11, green: 0.29, blue: 0.40, opacity: 1.00))
                .font(.system(size: 17))
                .bold()
        }
    }
    
    private var timeDetails: some View {
        VStack{
            Image(systemName: "alarm")
                .resizable()
                .frame(width: 47,height: 52)
                .foregroundColor(Color(red: 0.11, green: 0.29, blue: 0.40, opacity: 1.00))
                .bold()
            
            Text("Duração")
                .foregroundColor(Color(red: 0.11, green: 0.29, blue: 0.40, opacity: 1.00))
                .font(.system(size: 17))
            
            Text(receita.duracao)
                .foregroundColor(Color(red: 0.11, green: 0.29, blue: 0.40, opacity: 1.00))
                .bold()
                .font(.system(size: 17))
        }
    }
    
    private var bar: some View {
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: 1)
    }
    
    private var recipeDescription: some View {
        Text(receita.descricao)
            .font(.system(size: 17))
    }
    
    private var ingredientsTitle: some View {
        VStack(spacing: 8 ) {
            Text("Ingredientes")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading,.trailing], 8)
            
            ingredients
        }
    }
    
    private var ingredients: some View {
        VStack(alignment: .leading) {
            ForEach(receita.ingredientes, id: \.self) { ingredient in
                Text(" • " + ingredient)
                    .font(.system(size: 17))
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .padding([.leading,.trailing], 8)
            }
        }
    }
}

struct PreviaReceitaView_Previews: PreviewProvider {
    static var previews: some View {
        PreviaReceitaView(receita: Receitas(id: "1", titulo: "Banana pica", duracao: "1 minuto", descricao: "bananao", dificuldade: "dificil", ingredientes: ["1 colher", "1 banana"], passos: "corte banana", imagem: "a"))
    }
}
