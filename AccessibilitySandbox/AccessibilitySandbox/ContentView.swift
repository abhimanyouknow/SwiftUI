//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by C3PO MBP on 30/12/24.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
        Image(.character)
            .accessibilityHidden(true)
    }
}

#Preview {
    ContentView()
}
