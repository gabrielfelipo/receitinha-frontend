//
//  ReceitinhaTextField.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 06/08/23.
//

import SwiftUI

extension View {
    
    func focusablePadding(_ edges: Edge.Set = .all, _ size: CGFloat? = nil) -> some View {
        modifier(FocusablePadding(edges, size))
    }
    
}

private struct FocusablePadding : ViewModifier {
    
    private let edges: Edge.Set
    private let size: CGFloat?
    @FocusState private var focused: Bool
    
    init(_ edges: Edge.Set, _ size: CGFloat?) {
        self.edges = edges
        self.size = size
        self.focused = false
    }
    
    func body(content: Content) -> some View {
        content
            .focused($focused)
            .padding(edges, size)
            .contentShape(Rectangle())
            .onTapGesture { focused = true }
    }
    
}

struct ReceitinhaTextField: View {
    
    let placeholder: String
    let text: Binding<String>
    let spacing: CGFloat
    
    var body: some View {
        
        HStack {
            
            Spacer()
                .frame(width: spacing)
            
            TextField(placeholder, text: text)
                .focusablePadding(.all, 8)
                .background(.white)
                .foregroundColor(.blue)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 34)
                .cornerRadius(8)
        
            
            Spacer()
                .frame(width: spacing)
            
        }
    }
}




//struct ReceitinhaTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        ReceitinhaTextField()
//    }
//}
