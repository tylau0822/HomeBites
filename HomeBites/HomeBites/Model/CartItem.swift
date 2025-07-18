//
//  CartItem.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 7/6/2025.
//

import Foundation

class CartItem: Identifiable {
    let id = UUID()
    let dish: Dish
    var quantity: Int
    
    init(dish: Dish, quantity: Int = 1) {
        self.dish = dish
        self.quantity = quantity
    }
}
