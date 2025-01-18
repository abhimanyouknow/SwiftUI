//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by C3PO MBP on 17/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { number in
                    GeometryReader { proxy in
                        Text("Number: \(number)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .rotation3DEffect(
                                .degrees(-proxy.frame(in: .global).minX / 8),
                                axis: (x: 0, y: 1, z: 0))
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
