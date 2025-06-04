//
//  Item.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 4/6/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
