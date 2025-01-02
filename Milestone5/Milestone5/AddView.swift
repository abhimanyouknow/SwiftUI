//
//  AddView.swift
//  Milestone5
//
//  Created by C3PO MBP on 02/01/25.
//

import CoreImage
import PhotosUI
import SwiftData
import SwiftUI

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var processedImage: Image?
    @State private var selectedItem: PhotosPickerItem?
    
    let context = CIContext()
    
    @State private var inputName: String = ""
    @State private var inputImageData: Data?
    
    var disableSave: Bool {
        inputName.isEmpty || processedImage == nil
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("Enter the name of the person")
                    TextField("Enter name", text: $inputName)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No photo", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .onChange(of: selectedItem, loadImage)
                
                Spacer()
            }
            .toolbar {
                ToolbarItem {
                    Button("Save") {
                        let newPerson = People(name: inputName, photo: inputImageData!)
                        
                        modelContext.insert(newPerson)
                        dismiss()
                    }
                    .disabled(disableSave)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            
            inputImageData = imageData
            
            guard let inputImage = UIImage(data: imageData) else { return }
            
            let beginImage = CIImage(image: inputImage)
            
            guard let outputImage = beginImage else { return }
            
            guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
            
            let uiImage = UIImage(cgImage: cgImage)
            
            processedImage = Image(uiImage: uiImage)
        }
    }
}

#Preview {
    AddView()
}
