//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by C3PO MBP on 09/11/24.
//

import SwiftUI

// custom modifier
struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            content
                .font(.largeTitle)
                .foregroundStyle(.blue)
        }
    }
}

// custom extension
extension View {
    func titleStyle() -> some View {
        modifier(ProminentTitle())
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            RadialGradient(colors: [.blue, .black], center: .top, startRadius: 20, endRadius: 200)
            
            Text("Prominent Title")
                .titleStyle()
                /* NOTE: invoking the custom View
                 extension which in turn invokes the
                 custom modifier */
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
