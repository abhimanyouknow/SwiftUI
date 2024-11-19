//
//  ContentView.swift
//  Animations
//
//  Created by C3PO MBP on 18/11/24.
//

import SwiftUI

//struct ContentView: View {
//    // step 1: we need a state to store the amout of drag
//    //@State private var dragAmount = CGSize.zero
//    @State private var rotationAmount = Angle.zero
//    
//    var body: some View {
//        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(.rect(cornerRadius: 10))
//            .rotationEffect(rotationAmount)
//            .gesture(
//                RotateGesture()
//                    .onChanged { rotationAmount = $0.rotation }
//                    .onEnded { _ in rotationAmount = .zero }
//            )
//    }
//}

struct ContentView: View {
    @State private var rotationX = 0.0
    @State private var rotationY = 0.0
    @State private var rotationZ = 0.0

    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .rotation3DEffect(.degrees(rotationX), axis: (x: 1, y: 0, z: 0)) // Rotate around X-axis
            .rotation3DEffect(.degrees(rotationY), axis: (x: 0, y: 1, z: 0)) // Rotate around Y-axis
            .rotation3DEffect(.degrees(rotationZ), axis: (x: 0, y: 0, z: 1)) // Rotate around Z-axis
            .gesture(
                DragGesture()
                    .onChanged { value in
                        // Update rotation based on drag gesture
                        rotationX = Double(value.translation.height) / 20.0 // Adjust sensitivity
                        rotationY = Double(value.translation.width) / 20.0
                    }
                    .onEnded { _ in
                        // Optionally reset the rotation with animation
                        withAnimation {
                            rotationX = 0
                            rotationY = 0
                        }
                    }
            )
            .gesture(
                RotationGesture()
                    .onChanged { angle in
                        rotationZ = angle.degrees // Update Z-axis rotation
                    }
                    .onEnded { _ in
                        // Optionally reset Z-axis rotation with animation
                        withAnimation {
                            rotationZ = 0
                        }
                    }
            )
    }
}

#Preview {
    ContentView()
}
