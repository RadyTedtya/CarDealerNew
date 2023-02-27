//
//  Favorite.swift
//  CarDealerNew
//
//  Created by Tedtya rady on 28/12/22.
//

import SwiftUI


struct Favorite: View {
    
    @ObservedObject var carModel: CarModel
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(carModel.favoriteCars) {
                        CarRow(car: $0)
                    }
                }
            }
            .navigationTitle("Car Dealer")
            .navigationBarTitleDisplayMode(.inline)

        }
        
    }
    
    
}

struct Favorite_Preview: PreviewProvider {
    static var previews: some View {
        Favorite(carModel: .init())
        
    }
}





