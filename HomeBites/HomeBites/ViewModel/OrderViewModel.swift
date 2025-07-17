//
//  OrderViewModel.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 17/7/2025.
//

import Foundation
import SwiftData

class OrderViewModel: ObservableObject {
    @Published var orders: [Order] = []
    
    func saveOrder(context: ModelContext, from cartItems: [CartItem]) {
        let orderItems = cartItems.map { OrderItem(name: $0.dish.name) }
        let order = Order(items: orderItems)
        
        context.insert(order)

        do {
            try context.save()
        } catch {
            print("Error saving order: \(error)")
        }
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }

    func groupOrdersByDay(_ orders: [Order]) -> [String: [Order]] {
        Dictionary(grouping: orders) { formatDate($0.createdAt) }
    }
}
