//
//  ContentView.swift
//  Moonshot
//
//  Created by C3PO MBP on 25/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(.example)
            /* instead of using the asset name as a string, we
             can use .assetName in lowercase - it will result in
             the same thing and will be safer */
            .resizable() // lets us resize an image to fit a frame
            .scaledToFit() // scales the image to fit inside frame
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
    }
}

#Preview {
    ContentView()
}
