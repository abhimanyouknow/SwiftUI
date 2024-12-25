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
        VStack {
            MapReader { proxy in
                Map()
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            print(coordinate)
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
