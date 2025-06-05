//
//  Tab.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 5/6/2025.
//

import Foundation

enum Tab: String, CaseIterable {
    case menu = "Menu"
    case orders = "Orders"
    case profile = "Profile"
    
    var systemImage: String {
        switch self {
        case .menu: return "fork.knife"
        case .orders: return "list.clipboard"
        case .profile: return "person"
        }
    }
}
