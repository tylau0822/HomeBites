//
//  OrdersView.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 17/7/2025.
//

import SwiftUI
import SwiftData

struct OrdersView: View {
    @Query(sort: \Order.createdAt, order: .reverse) private var orders: [Order]
    @StateObject private var viewModel = OrderViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.groupOrdersByDay(orders).sorted(by: { $0.key > $1.key }), id: \.key) { date, ordersForDate in
                    Section(header: Text(date)) {
                        ForEach(ordersForDate) { order in
                            VStack(alignment: .leading) {
                                ForEach(order.items) { item in
                                    Text(item.name)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    OrdersView()
}
