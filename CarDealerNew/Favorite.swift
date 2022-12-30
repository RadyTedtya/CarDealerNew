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
                ScrollView{
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
//
//
//struct carRow: View {
//    var car: Car
//    var body: some View {
//        NavigationLink(destination: CarDetail(car: car, carModel: <#T##CarModel#>)) {
//            HStack(alignment: .center, spacing: 40) {
//
//                Image(car.imageName)
//                    .resizable().frame(width:60 , height: 50)
//
//                Text("\(car.name)")
//                Spacer()
//            }
//            .frame(maxWidth: .infinity)
//            .frame(height: 75)
//            .padding()
//            .background(Color.gray.opacity(0.1))
//            .clipShape(RoundedRectangle(cornerRadius: 20))
//            .padding(.horizontal)
//
//        }
//
//    }
//}


struct Favorite_Preview: PreviewProvider {
    static var previews: some View {
        Favorite(carModel: .init())
        
    }
}





