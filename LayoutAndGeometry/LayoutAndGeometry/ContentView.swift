//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by C3PO MBP on 17/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)
            
            GeometryReader { proxy in
                Image(.example)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
                    .frame(width: proxy.size.width, height: proxy.size.height) // for centering the image
            }
        }
    }
}

#Preview {
    ContentView()
}
