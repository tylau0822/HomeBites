//
//  TabShape.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 5/6/2025.
//

import SwiftUI

struct TabShape: Shape {
    var midpoint: CGFloat
    
    var animatableData: CGFloat {
        get { midpoint }
        set { midpoint = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            // Draw rectangle shape
            path.addPath(Rectangle().path(in: rect))
            
            // Draw upward curve shape
            path.move(to: .init(x: midpoint - 60, y: 0))
            
            let to = CGPoint(x: midpoint, y: -25)
            let control1 = CGPoint(x: midpoint - 30, y: 0)
            let control2 = CGPoint(x: midpoint - 30, y: -25)
            
            path.addCurve(to: to, control1: control1, control2: control2)
            
            let to1 = CGPoint(x: midpoint + 60, y: 0)
            let control3 = CGPoint(x: midpoint + 30, y: -25)
            let control4 = CGPoint(x: midpoint + 30, y: 0)
            
            path.addCurve(to: to1, control1: control3, control2: control4)
        }
    }
}
