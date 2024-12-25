//
//  ContentView.swift
//  BucketList
//
//  Created by C3PO MBP on 24/12/24.
//

import MapKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        Map(interactionModes: [.rotate, .zoom])
            .mapStyle(.hybrid(elevation: .realistic))
    }
}

#Preview {
    ContentView()
}
