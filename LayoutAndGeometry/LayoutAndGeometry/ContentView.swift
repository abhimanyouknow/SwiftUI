//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by C3PO MBP on 17/01/25.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        let distanceFromTop = proxy.frame(in: .global).minY
                        let totalHeight = fullView.size.height
                        
                        Text("Row #\(index)")
                            .font(.title)
                            .foregroundStyle(.white)
                            // challenge 2 - part 1
                            .frame(width: 50 + (distanceFromTop / totalHeight) * 355)
                            // challenge 3
                            .background(
                                Color(
                                    hue: min(1, distanceFromTop / totalHeight),
                                    saturation: 0.5,
                                    brightness: 0.5
                                )
                                // challenge 1
                                .opacity(
                                    max(0, min(1, (distanceFromTop / totalHeight)))
                                    )
                            )
                            .rotation3DEffect(.degrees(distanceFromTop - totalHeight / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            // challenge 2 - part 2
                            .frame(width: proxy.size.width, height: proxy.size.height)
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
