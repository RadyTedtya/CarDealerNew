//
//  CarModel.swift
//  CarDealerNew
//
//  Created by Tedtya rady on 29/12/22.
//

import Foundation
import SwiftUI

class CarModel : ObservableObject {
    @Published private(set) var cars : [Car] = []
    @Published var favoriteCars : [Car] = []
    @Published var selectedCarType: CarType = .all
    
    init() {
        if let url = Bundle.main.url(forResource: "CarResources/cars", withExtension: "json"){
            do {
                let data = try Data (contentsOf: url);
                cars = try JSONDecoder().decode([Car].self, from: data);
            } catch (let e) {
                print(e)
            }
        }
    }
    
    func cars(forType type: CarType) -> [Car] {
        return cars.filter { $0.type == type }
    }
    
    func add(car: Car){
        cars.append(car)
    }
    
}
