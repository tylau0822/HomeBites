//
//  FloatingTabBar.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 7/6/2025.
//

import SwiftUI

struct FloatingTabBar: View {
    @Binding var activeTab: Tab
    @Binding var showAddDishModal: Bool
    @Namespace private var animation /// For Matched Geometry Effect
    
    var body: some View {
        let status = activeTab == .menu
        
        HStack(spacing: !status ? 0 : 12) {
            Button {
                showAddDishModal = true
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .frame(width: 42, height: 42)
                    .foregroundStyle(.white)
                    .background(.ashyBlue.gradient)
                    .clipShape(.circle)
            }.allowsHitTesting(status)
            .offset(x: status ? 0 : 20)
            .padding(.trailing, status ? 0: -42)
            
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button {
                        activeTab = tab
                    } label: {
                        HStack(spacing: 5) {
                            Image(systemName: tab.systemImage)
                                .font(.title3)
                                .frame(width: 30, height: 30)
                            
                            if activeTab == tab {
                                Text(tab.rawValue)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .lineLimit(1)
                            }
                        }
                        .foregroundStyle(activeTab == tab ? .white : .heather)
                        .padding(.vertical, 2)
                        .padding(.leading, 10)
                        .padding(.trailing, 15)
                        .contentShape(.rect)
                        .background(
                            Group {
                                if activeTab == tab {
                                    Capsule()
                                        .fill(.ashyBlue.gradient)
                                        .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                                }
                            }
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 5)
            .frame(height: 45)
            .background(
                .background
                    .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: 5, y: 5))
                    .shadow(.drop(color: .black.opacity(0.06), radius: 5, x: -5, y: -5)),
                in: .capsule
            )
            .zIndex(10)
        }
        .animation(.smooth(duration: 0.3, extraBounce: 0), value: activeTab)
    }
}

#Preview {
    HomeView()
}
