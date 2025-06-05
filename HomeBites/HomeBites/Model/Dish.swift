//
//  Dish.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 4/6/2025.
//

import Foundation

struct Dish: Identifiable {
    let id = UUID()
    var name: String
    var image: String?
    var rating: Int
}

extension Dish {
    static func all() -> [Dish] {
        return [
            Dish(name: "Roast Chicken", image: "roast_chicken", rating: 4),
            Dish(name: "Pasta", image: "pasta", rating: 5)
        ]
    }
}
