//
//  ContentView.swift
//  Instafilter
//
//  Created by C3PO MBP on 18/12/24.
//

// step 1
import PhotosUI
import SwiftUI

struct ContentView: View {
    // step 2
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    var body: some View {
        VStack {
            // step 3
            PhotosPicker("Select a picture", selection: $pickerItems, maxSelectionCount: 3, matching: .images)
            
            // step 5
            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        // step 4
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()
                
                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
