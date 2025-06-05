//
//  MenuView.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 4/6/2025.
//

import SwiftUI

struct MenuView: View {
    let dishes = Dish.all()
    
    var body: some View {
        GeometryReader { proxy in
            let safeAreaTop = proxy.safeAreaInsets.top
            
            VStack(spacing: 0) {
                HeaderView(safeAreaTop)
                
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
        }
    }
    
    @ViewBuilder
    func HeaderView(_ safeAreaTop: CGFloat) -> some View {
        ZStack(alignment: .bottom) {
            Image("kitchen_cupboard")
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
                .opacity(0.9)
            
            VStack(alignment: .leading) {
                Text("HomeBites")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .shadow(radius: 4)
    
                HStack(spacing: 8) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.white)
    
                    Text("The Cozy Stove")
                        .bold()
                        .foregroundStyle(.white)
                        .shadow(radius: 4)
    
                    Spacer()
                }
            }.padding()
        }
    }
}

#Preview {
    MenuView()
}
