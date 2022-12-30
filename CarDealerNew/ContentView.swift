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
      
        TabView{
//            Manufacture(cars: CarModel.cars())
            Manufacture(carModel: carModel)
                .tabItem{
                    Label("Manufacture", systemImage: "list.bullet")
                }
            
            Favorite()
                .tabItem{
                    Label("Favorite", systemImage: "star.fill")
                }
        }
        
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        ContentView(cars: cars)
//    }
//}
