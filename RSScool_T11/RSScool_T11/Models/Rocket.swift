//
//  Rocket.swift
//  RSScool_T11
//
//  Created by Маргарита Жучик on 8.09.21.
//

import Foundation
import UIKit

struct RocketModel: Decodable {
    var id: String
    var mainImage: UIImage?
    var flickrImages: [String]?
    var name: String? = "Falcon Heavy"
    var firstFlight: Date
    var costPerLaunch: Int = 0
    var successRatePct: Int = 0
    var mass: Weight
//    var height: Height
//    var diameter: Diameter
    var description: String
    var wikipedia: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, firstFlight, successRatePct, costPerLaunch, flickrImages, mass, description, wikipedia
    }
}

struct Weight: Decodable {
    var kg: Int
}

struct Height: Decodable {
    var meters: Int
}

struct Diameter: Decodable {
    var meters: Double
}
