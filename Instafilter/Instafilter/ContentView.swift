//
//  ContentView.swift
//  Instafilter
//
//  Created by C3PO MBP on 18/12/24.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?
    
    @State private var currentFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .onChange(of: selectedItem, loadImage)
                
                Spacer()
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity, applyProcessing)
                }
                
                HStack {
                    Button("Change filter", action: changeFilter)
                    
                    Spacer()
                    
                    // share the image
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
        }
    }
    
    func loadImage()  {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            
            // send whatever image was chosen into the sepiatone filter
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            
            // then call the applyProcessing() method
            applyProcessing()
        }
    }
    
    // method to process whichever image was imported
    func applyProcessing() {
        // set the intensity of the filter
        currentFilter.intensity = Float(filterIntensity)
        
        // read the output image from our filter
        guard let outputImage = currentFilter.outputImage else { return }
        
        // convert this output image into actual pixels
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        // create a UI image using the cgImage
        let uiImage = UIImage(cgImage: cgImage)
        
        // create a SwiftUI image using the UI image
        processedImage = Image(uiImage: uiImage)
    }
    
    func changeFilter() {
        
    }
}

#Preview {
    ContentView()
}
