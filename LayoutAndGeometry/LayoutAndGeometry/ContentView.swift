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
                        Text("Row #\(index)")
                            .font(.title)
                            // challenge 2 - part 1
                            .frame(width: 50 + (proxy.frame(in: .global).minY / fullView.size.height) * 355)
                            // challenge 1
                            .background(colors[index % 7].opacity(
                                max(0, min(1, (proxy.frame(in: .global).minY / fullView.size.height)))
                            ))
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
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
