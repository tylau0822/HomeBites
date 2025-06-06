//
//  Dish.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 4/6/2025.
//

import Foundation
import SwiftData

@Model
class Dish: Identifiable {
    let id = UUID()
    var name: String
    var imageData: Data?
    var rating: Int
    var isAvailable: Bool
    var dishDescription: String
    
    init(name: String = "", imageData: Data? = nil, rating: Int = 5, isAvailable: Bool = true, dishDescription: String = "") {
        self.name = name
        self.imageData = imageData
        self.rating = rating
        self.isAvailable = isAvailable
        self.dishDescription = dishDescription
    }
}
