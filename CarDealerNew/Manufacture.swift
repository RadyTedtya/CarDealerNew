//
//  Manufacture.swift
//  CarDealerNew
//
//  Created by Tedtya rady on 28/12/22.
//

import SwiftUI

struct Manufacture: View {
    
    @ObservedObject var carModel: CarModel
    
    //    @State private var selectedCarType: CarType = .all
    
    var dataSource: [Car] {
        if carModel.selectedCarType == .all {
            return carModel.cars
        }
        return carModel.cars.filter { $0.type == carModel.selectedCarType }
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                Picker("Car Type", selection: $carModel.selectedCarType){
                    ForEach(CarType.allCases) {
                        Text($0.rawValue.capitalized).tag($0)
                    }
                }
                .pickerStyle(.segmented)
                .frame(maxWidth: .infinity)
                
                ScrollView{
                    ForEach(dataSource) { eachCar in
                        NavigationLink(destination: CarDetail(car: eachCar, carModel: carModel)) {
                            CarRow(car: eachCar)
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("Car Dealer")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    NavigationLink(destination: {
                AddNewCar(carModel: carModel)
            }, label: {
                Image(systemName: "plus.circle.fill")
            }))
        }
    }
}

struct CarRow: View {
    var car: Car
    var body: some View {
        
            HStack(alignment: .center, spacing: 40) {
                Image(car.imageName)
                    .resizable().frame(width:60 , height: 50)
                
                Text("\(car.name)")
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 75)
            .padding()
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
    }
}

struct Manufacture_Preview: PreviewProvider {
    static var previews: some View {
        Manufacture(carModel: .init())
    }
}
