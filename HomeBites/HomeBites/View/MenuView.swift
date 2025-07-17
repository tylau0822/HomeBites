//
//  MenuView.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 4/6/2025.
//

import SwiftUI
import SwiftData

struct MenuView: View {
    @Query private var dishes: [Dish]
    @ObservedObject var cartVM: CartViewModel
    @Binding var showAddDishModal: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HeaderView()
                
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
                                DishCard(dish: dish, cartVM: cartVM)
                            }
                        }.padding(.horizontal, 4)
                        .padding(.vertical, 8)
                    }
                }
            }.edgesIgnoringSafeArea(.top)
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
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
                    
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(5)
                        .foregroundStyle(.white)
                        .background(Color.black.opacity(0.6))
                        .clipShape(Circle())
                        .onTapGesture {
                            showAddDishModal = true
                        }
                    
                    NavigationLink(destination: CartView(cartVM: cartVM)) {
                        Image(systemName: "cart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(5)
                            .foregroundStyle(.white)
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                }
            }.padding()
        }
    }
}

#Preview {
    MenuView(cartVM: CartViewModel(), showAddDishModal: .constant(false))
}
