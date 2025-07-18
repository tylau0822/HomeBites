//
//  CartViewModel.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 7/6/2025.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var items: [CartItem] = []
    
    func quantity(for dish: Dish) -> Int {
        items.first(where: { $0.dish.id == dish.id })?.quantity ?? 0
    }
    
    func add(dish: Dish) {
        if let index = items.firstIndex(where: { $0.dish.id == dish.id }) {
            var updatedItem = items[index]
            updatedItem.quantity += 1
            items[index] = updatedItem
        } else {
            items.append(CartItem(dish: dish))
        }
    }
    
    func minus(dish: Dish) {
        if let index = items.firstIndex(where: { $0.dish.id == dish.id }) {
            var updatedItem = items[index]
            if updatedItem.quantity > 1 {
                updatedItem.quantity -= 1
                items[index] = updatedItem
            } else {
                remove(dish: dish)
            }
        }
    }
    
    func remove(dish: Dish) {
        items.removeAll { $0.dish.id == dish.id }
    }
    
    func clear() {
        items.removeAll()
    }
}
