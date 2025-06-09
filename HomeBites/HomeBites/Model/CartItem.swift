//
//  CartItem.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 7/6/2025.
//

import Foundation

struct CartItem: Identifiable, Equatable {
    let id = UUID()
    let dish: Dish
}
