//
//  Car.swift
//  CarDealerNew
//
//  Created by Tedtya rady on 29/12/22.
//

import Foundation

struct Car: Identifiable, Decodable {
    
    var id: UUID {
        UUID.init()
    }
    
    let name: String
    let locations: String
    let imageName: String
    let thumbnailName: String
    let type: CarType
    
    static let DummyCar: Car = .init(name: "", locations: "", imageName: "", thumbnailName: "", type: CarType.electric)
    
}

enum CarType: String, Decodable, Identifiable, CaseIterable {
    case all
    case electric
    case petrol
    case diesel
    
    var id: String {
        return rawValue
    }
}


