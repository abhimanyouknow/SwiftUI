//
//  ContentView.swift
//  Animations
//
//  Created by C3PO MBP on 18/11/24.
//

import SwiftUI

struct ContentView: View {
    // step 1: we need a state to store the amout of drag
    @State private var dragAmount = CGSize.zero
    //@State private var dragAmount = Angle.zero
    
    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
                /* step 2: we need to use dragAmount to
                 influence the position of the card on the
                 screen -> for this we use the .offset()
                 modifier */
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation {
                            dragAmount = .zero
                        }
                    }
            )
                /* step 3: create a drag gesture object and
                 attach it to the card */
            
        
//            .gesture(
//                RotateGesture()
//                    .onChanged { dragAmount = $0.rotation }
//                    .onEnded { _ in dragAmount = .zero }
//            )
    }
}

#Preview {
    ContentView()
}
