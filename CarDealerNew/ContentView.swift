//
//  ContentView.swift
//  CarDealerNew
//
//  Created by Tedtya rady on 28/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var carModel: CarModel = .init()
    
    var body: some View {
      
        TabView {

            Manufacture(carModel: carModel)
                .tabItem{
                    Label("Manufacture", systemImage: "list.bullet")
                }
            
            Favorite(carModel: carModel)
                .tabItem{
                    Label("Favorite", systemImage: "star.fill")
                }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView(carModel: .init())
    }
}
