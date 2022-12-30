//
//  AddNewCar.swift
//  CarDealerNew
//
//  Created by Tedtya rady on 29/12/22.
//


import Foundation
import SwiftUI

struct AddNewCar: View {
    
    
    @ObservedObject var carModel: CarModel
    @State public var textArea: String = ""
    @State public var carName: String = ""
    @State public var image: String = ""
    @State public var location: String = ""
    @State public var thumbNail: String = ""
    @State public var selectedType: CarType = .petrol
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .center, spacing: 10) {
                TextField("Car Name", text: $carName)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .foregroundColor(Color.gray)
                    .padding()
                    
                    
                
//                Picker("Car Type", selection: $carModel.selectedCarType){
                Picker("Car Type", selection: $selectedType){
                    ForEach(CarType.allCases.filter { $0 != .all } ) {
                        Text($0.rawValue.capitalized).tag($0)
                    }
                }
                .foregroundColor(Color.black)
                .pickerStyle(.wheel)
                
                TextEditor(text: $textArea)
                    .padding()
                    .foregroundColor(Color.gray)
                    .lineSpacing(10)
                    .font(.custom("HelveticaNeue", size: 13))
                    .overlay(
                             RoundedRectangle(cornerRadius: 25)
                               .stroke(Color.black, lineWidth: 1)
                             )
                    .padding()
                
                Spacer()
                
            }
            
            
        }
        .navigationTitle("Add New Car")
        .navigationBarItems(trailing:
        Button(action: {
//            carModel.add(car: carModel.cars.first!)
            let newCar = Car(name: carName, locations: location, imageName: image, thumbnailName: thumbNail, type: selectedType)
            carModel.add(car: newCar)
        }) {
            Text("Add Car")
        })
    }
    
    
}



struct AddNewCar_Preview: PreviewProvider {
    static var previews: some View {
        AddNewCar(carModel: .init())
    }
}
