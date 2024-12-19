//
//  ContentView.swift
//  Instafilter
//
//  Created by C3PO MBP on 18/12/24.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        // step 1: loading our image into a UIImage
        let inputImage = UIImage(resource: .example)
        
        // step 2: putting this image recipe into a CIImage
        let beginImage = CIImage(image: inputImage)
        
        // step 3: making a CoreImage context & a CoreImage filter
        let context = CIContext()
        let currentFilter = CIFilter.sepiaTone()
        
        // passing in two parameters to currentFilter - the image we want to apply the filter to, and the intensity
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 1 // max intensity
        
        // now we convert the output from our filter to a SwiftUI image we can display in our view
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        let uiImage = UIImage(cgImage: cgImage)
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    ContentView()
}
