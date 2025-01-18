//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by C3PO MBP on 17/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
            Image(.abhimanyu)
                .resizable()
                .scaledToFit()
                .frame(width: proxy.size.width * 0.8)
        }
    }
}

#Preview {
    ContentView()
}
