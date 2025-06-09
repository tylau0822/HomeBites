//
//  CartViewModel.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 7/6/2025.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var items: [CartItem] = [
        CartItem(dish: Dish(name: "Chicken"))
    ]
    
    func add(dish: Dish) {
        items.append(CartItem(dish: dish))
    }
    
    func remove(dish: Dish) {
        items.removeAll { $0.dish.id == dish.id }
    }
    
    func clear() {
        items.removeAll()
    }
}
