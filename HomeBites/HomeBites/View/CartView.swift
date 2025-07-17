//
//  CartView.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 7/6/2025.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cartVM: CartViewModel
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack {
            if cartVM.items.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "cart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray.opacity(0.5))
                    Text("Your cart is empty")
                        .foregroundColor(.gray)
                }
            } else {
                List {
                    ForEach(cartVM.items) { item in
                        HStack(alignment: .center, spacing: 12) {
                            if let data = item.dish.imageData, let uiImage = UIImage(data: data) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            } else {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(width: 50, height: 50)
                                    .overlay(Image(systemName: "photo").foregroundColor(.gray))
                            }
                            
                            Text(item.dish.name)
                                .lineLimit(2)
                                .font(.system(size: 14))
                                .bold()
                        }
                    }.onDelete(perform: deleteItem)
                }
                
                Spacer()
                
                Button("Place order") {
                    let orderVM = OrderViewModel()
                    orderVM.saveOrder(context: context, from: cartVM.items)
                    cartVM.clear()
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                .background(.ashyBlue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()
            }
        }.navigationTitle("Cart")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
    }
    
    private func deleteItem(at offsets: IndexSet) {
        cartVM.items.remove(atOffsets: offsets)
    }
}

#Preview {
    CartView(cartVM: CartViewModel())
}
