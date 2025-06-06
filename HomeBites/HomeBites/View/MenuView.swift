//
//  MenuView.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 4/6/2025.
//

import SwiftUI

struct MenuView: View {
    let dishes = Dish.all()
    @State private var showAddDishModal: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(showAddDishModal: $showAddDishModal)
            
            HStack(spacing: 8) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        Button(action: {
                        }) {
                            HStack(spacing: 4) {
                                Rectangle()
                                    .fill(.cyanBlue)
                                    .frame(width: 2)
                                
                                Text("All")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 4)
                                    .foregroundStyle(.cyanBlue)
                                
                                Spacer()
                            }.padding(.all, 4)
                        }
                    }
                }.frame(width: 90)
                
                Divider()
                
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(dishes) { dish in
                            DishCard(dish: dish)
                        }
                    }.padding(.horizontal, 4)
                    .padding(.vertical, 8)
                }
            }.padding(.bottom)
        }.edgesIgnoringSafeArea(.top)
        .sheet(isPresented: $showAddDishModal) {
            AddDishView()
        }
    }
}

#Preview {
    MenuView()
}
