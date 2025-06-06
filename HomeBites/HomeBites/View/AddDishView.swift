//
//  AddDishView.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 5/6/2025.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddDishView: View {
    @StateObject private var viewModel = DishViewModel()
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // Image
                    HStack {
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem, matching: .images) {
                            if let image = viewModel.selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(25)
                            } else {
                                VStack(spacing: 4) {
                                    Image(systemName: "photo.badge.plus")
                                        .font(.title)
                                        .foregroundStyle(.ashyBlue)
                                    
                                    Text("Upload image")
                                        .font(.system(size: 12))
                                        .foregroundStyle(.cyanBlue)
                                }.frame(width: 120, height: 120)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(25)
                            }
                        }.onChange(of: viewModel.selectedItem) {
                            viewModel.handleImageSelection()
                        }
                        
                        Spacer()
                    }.listRowSeparator(.hidden)
                    
                    // Name
                    HStack(spacing: 16) {
                        Text("Name")
                            .font(.system(size: 14))
                        Spacer()
                        TextField("Enter Dish name", text: $viewModel.name)
                            .font(.system(size: 14))
                            .multilineTextAlignment(.trailing)
                    }

                    // Rating
                    HStack {
                        Text("Rating")
                            .font(.system(size: 14))
                        Spacer()
                        HStack(spacing: 2) {
                            ForEach(1...5, id: \.self) { index in
                                Image(systemName: index <= viewModel.rating ? "star.fill" : "star")
                                    .font(.system(size: 14))
                                    .foregroundColor(.yellow)
                                    .onTapGesture {
                                        viewModel.rating = index
                                    }
                            }
                        }
                    }

                    // Availability
                    HStack {
                        Text("Available")
                            .font(.system(size: 14))
                        Spacer()
                        Toggle("", isOn: $viewModel.isAvailable)
                            .labelsHidden()
                            .scaleEffect(0.8)
                    }
                        

                    // Description
                    HStack(alignment: .top, spacing: 16) {
                        Text("Description")
                            .font(.system(size: 14))
                        TextEditor(text: $viewModel.dishDescription)
                            .frame(height: 100)
                            .font(.system(size: 14))
                            .padding(.vertical, -8)
                    }
                }
                
                Spacer()
                
                // Save Button
                Button("Save") {
                    viewModel.save(context: context)
                    dismiss()
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                .background(viewModel.isValid ? .ashyBlue : .heather)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()
                .disabled(!viewModel.isValid)
            }.navigationTitle(Text("Add Dish"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddDishView()
}
