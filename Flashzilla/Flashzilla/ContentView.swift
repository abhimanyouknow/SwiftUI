//
//  ContentView.swift
//  Flashzilla
//
//  Created by C3PO MBP on 11/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped")
                }
            
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Circle tapped")
                }
                .allowsHitTesting(false)
        }
    }
}

#Preview {
    ContentView()
}
