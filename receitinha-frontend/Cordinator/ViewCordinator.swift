//
//  ViewCordinator.swift
//  receitinha-frontend
//
//  Created by alexdamascena on 06/08/23.
//

import SwiftUI

class ViewCordinator: ObservableObject {
    
    @Published var path: [Route] = []
    
    func push(view newView: Route){
        path.append(newView)
    }
    
    func pop(){
        path.removeLast()
    }
    
    func goToHome(){
        while(path.count != 1) {
            self.pop()
        }
        
        path[0] = .tab
    }
}
