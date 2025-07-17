//
//  HomeView.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 4/6/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var cartVM = CartViewModel()
    @State private var activeTab: Tab = .menu
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero
    @State private var showAddDishModal: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            TabView {
                MenuView(cartVM: cartVM, showAddDishModal: $showAddDishModal)
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                    }
                
                OrdersView()
                    .tabItem {
                        Label("Orders", systemImage: "cart.fill")
                    }
                
                Text("Profile")
                    .tabItem {
                        Label("Profile", systemImage: "person.circle.fill")
                    }
            }
            
        }.sheet(isPresented: $showAddDishModal) {
            AddDishView()
        }
    }
}

#Preview {
    HomeView()
}
