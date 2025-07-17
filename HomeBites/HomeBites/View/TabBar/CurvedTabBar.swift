//
//  CurvedTabBar.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 9/6/2025.
//

import SwiftUI

struct CurvedTabBar: View {
    @Binding var activeTab: Tab
    @State private var tabShapePosition: CGPoint = .zero
    @Binding var showAddDishModal: Bool
    @Namespace private var animation /// For Matched Geometry Effect

    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(tab: $0,
                        animation: animation,
                        activeTab: $activeTab,
                        position: $tabShapePosition
                )
            }
        }.padding(.horizontal, 15)
        .padding(.top, 10)
        .background(content: {
            TabShape(midpoint: tabShapePosition.x)
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: .ashyBlue.opacity(0.2), radius: 3, x: 0, y: -3)
                .blur(radius: 1)
                .padding(.top, 25)
        })
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}

struct TabItem: View {
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    @Binding var position: CGPoint
    @State private var tabPosition: CGPoint = .zero
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundStyle(activeTab == tab ? .white : .heather)
                .frame(width: activeTab == tab ? 50 : 35, height: activeTab == tab ? 50 : 35)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(.ashyBlue.gradient).matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundStyle(activeTab == tab ? .cyanBlue : .heather)
        }.frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition(completion: { rect in
            tabPosition.x = rect.midX
            
            if activeTab == tab {
                position.x = rect.midX
            }
        })
        .onTapGesture {
            activeTab = tab
            
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                position.x = tabPosition.x
            }
        }
    }
}

#Preview {
    HomeView()
}
