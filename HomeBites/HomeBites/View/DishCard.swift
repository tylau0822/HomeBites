//
//  DishCard.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 4/6/2025.
//

import SwiftUI

struct DishCard: View {
    let dish: Dish
    
    var body: some View {
        HStack(alignment: .center) {
            HStack(alignment: .top, spacing: 12) {
                Image(dish.image ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(dish.name)
                        .lineLimit(2)
                        .font(.system(size: 14))
                        .bold()
                    
                    HStack(spacing: 2) {
                        ForEach(1...5, id: \.self) { index in
                            Image(systemName: index <= dish.rating ? "star.fill" : "star")
                                .font(.system(size: 12))
                                .foregroundColor(.yellow)
                        }
                    }
                }
            }
            
            Spacer()
            
            Button {
            } label : {
                Image(systemName: "plus.circle.fill")
                    .font(.title2)
                    .foregroundColor(.ashyBlue)
            }
        }
    }
}

#Preview {
    DishCard(dish: Dish(name: "Roast Chicken", image: "roast_chicken", rating: 4))
}
