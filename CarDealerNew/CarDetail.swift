//
//  CarDetail.swift
//  CarDealerNew
//
//  Created by Tedtya rady on 30/12/22.
//

import Foundation

import SwiftUI


struct CarDetail: View {
    let car: Car
    @ObservedObject var carModel: CarModel
    @State var carLocation: String = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                Image(car.imageName)
                    .resizable()
                    .frame(width: 300 ,height: 150)
                
                Text("Car Model: " + car.name)
                    .foregroundColor(Color.black)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Car Type: " + car.type.rawValue)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextEditor(text: $carLocation)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(Color.gray)
                    .lineSpacing(10)
                    .font(.custom("HelveticaNeue", size: 13))
                    .padding()
                
            }
        }
        .navigationTitle("Car Detail")
        .navigationBarItems(trailing:
                                Image(systemName: "star")
                                .onTapGesture {
            carModel.favoriteCars.append(car)
        }
        .foregroundColor(Color.blue)
        )
        
        
    }
    
    
}


struct CarDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        CarDetail(car: Car.DummyCar, carModel: .init())
    }
}
