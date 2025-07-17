//
//  Order.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 17/7/2025.
//

import Foundation
import SwiftData

@Model
class Order {
    let id = UUID()
    var items: [OrderItem]
    var createdAt: Date
    
    init(items: [OrderItem], createdAt: Date = .now) {
        self.items = items
        self.createdAt = createdAt
    }
}

@Model
class OrderItem {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
