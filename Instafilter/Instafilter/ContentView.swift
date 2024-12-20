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
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var body: some View {
        VStack {
            // step 3
            PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
            
            // step 5
            selectedImage?
                .resizable()
                .scaledToFit()
        }
        // step 4
        .onChange(of: pickerItem) {
            Task {
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
            }
        }
    }
}

#Preview {
    ContentView()
}
