//
//  DishViewModel.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 6/6/2025.
//

import SwiftUI
import SwiftData
import PhotosUI

@MainActor
class DishViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var rating: Int = 5
    @Published var isAvailable: Bool = true
    @Published var dishDescription: String = ""
    @Published var selectedImage: UIImage?
    @Published var selectedItem: PhotosPickerItem?

    func save(context: ModelContext) {
        let imageData = selectedImage?.jpegData(compressionQuality: 0.8)
        let newDish = Dish(name: name, imageData: imageData, rating: rating, isAvailable: isAvailable, dishDescription: dishDescription)
        context.insert(newDish)
        
        do {
            try context.save()
        } catch {
            print("Failed to save dish: \(error)")
        }
    }

    func handleImageSelection() {
        Task {
            if let data = try? await selectedItem?.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                self.selectedImage = uiImage
            }
        }
    }

    var isValid: Bool {
        !name.isEmpty
    }
}
