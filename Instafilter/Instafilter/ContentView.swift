//
//  ContentView.swift
//  Instafilter
//
//  Created by C3PO MBP on 18/12/24.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    // challenge 2 - part 1
    @State private var filterRadius = 0.5
    @State private var filterScale = 0.5
    @State private var selectedItem: PhotosPickerItem?
    @State private var showingFilters = false
    
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
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
                
                // challenge 2 - part 2
                HStack {
                    let inputKeys = currentFilter.inputKeys
                    
                    if inputKeys.contains(kCIInputIntensityKey) {
                        Text("Intensity")
                        Slider(value: $filterIntensity)
                            .onChange(of: filterIntensity, applyProcessing)
                    }
                    
                    
                    if inputKeys.contains(kCIInputRadiusKey) {
                        Text("Radius")
                        Slider(value: $filterRadius)
                            .onChange(of: filterRadius, applyProcessing)
                    }
                    
                    if inputKeys.contains(kCIInputScaleKey) {
                        Text("Scale")
                        Slider(value: $filterScale)
                            .onChange(of: filterScale, applyProcessing)
                    }
                }
                // challenge 1 - part 1
                .disabled(processedImage == nil)
                
                HStack {
                    Button("Change filter", action: changeFilter)
                    
                    Spacer()
                    
                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage))
                    }
                }
                // challenge 1 - part 2
                .disabled(processedImage == nil)
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .confirmationDialog("Select a filter", isPresented: $showingFilters) {
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                
                Button("Cancel", role: .cancel) { }
            }
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
        // set the applicable value of the filter
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        // challenge 2 - part 3
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterRadius * 100, forKey: kCIInputRadiusKey)
        }
        // challenge 2 - part 4
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterScale * 10, forKey: kCIInputScaleKey)
        }
        
        
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
        showingFilters = true
    }
    
    @MainActor func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
        
        filterCount += 1
        
        if filterCount >= 20 {
            requestReview()
        }
    }
}

#Preview {
    ContentView()
}
