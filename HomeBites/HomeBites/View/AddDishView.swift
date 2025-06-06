//
//  AddDishView.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 5/6/2025.
//

import SwiftUI
import PhotosUI

struct AddDishView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
    @State private var name: String = ""
    @State private var rating: Int = 5
    @State private var isAvailable: Bool = true
    @State private var description: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // Image
                    HStack {
                        Spacer()
                        
                        PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                            if let image = selectedImage {
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
                        }.onChange(of: selectedItem) { _, newItem in
                            Task {
                                if let data = try? await newItem?.loadTransferable(type: Data.self), let uiImage = UIImage(data: data) {
                                    selectedImage = uiImage
                                }
                            }
                        }
                        
                        Spacer()
                    }.listRowSeparator(.hidden)
                    
                    // Name
                    HStack(spacing: 16) {
                        Text("Name")
                            .font(.system(size: 14))
                        Spacer()
                        TextField("Enter Dish name", text: $name)
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
                                Image(systemName: index <= rating ? "star.fill" : "star")
                                    .font(.system(size: 14))
                                    .foregroundColor(.yellow)
                                    .onTapGesture {
                                        rating = index
                                    }
                            }
                        }
                    }

                    // Availability
                    HStack {
                        Text("Available")
                            .font(.system(size: 14))
                        Spacer()
                        Toggle("", isOn: $isAvailable)
                            .scaleEffect(0.7, anchor: .trailing)
                    }
                        

                    // Description
                    HStack(alignment: .top, spacing: 16) {
                        Text("Description")
                            .font(.system(size: 14))
                        TextEditor(text: $description)
                            .frame(height: 100)
                            .font(.system(size: 14))
                            .padding(.vertical, -8)
                    }
                }
                
                Spacer()
                
                // Save Button
                Button("Save") {
                    dismiss()
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                .background(name.isEmpty ? .heather : .ashyBlue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()
                .disabled(name.isEmpty)
            }.navigationTitle(Text("Add Dish"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddDishView()
}
