//
//  ContentView.swift
//  BucketList
//
//  Created by C3PO MBP on 24/12/24.
//

import MapKit
import SwiftUI

// step 1: defining a new type that contains location info (this must conform to Identifiable)
struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    // step 2: make an array of all those locations in one place
    let locations = [
        Location(name: "Old Trafford", coordinate: CLLocationCoordinate2D(latitude: 53.4631, longitude: -2.2913)),
        Location(name: "Wembly", coordinate: CLLocationCoordinate2D(latitude: 51.5560, longitude: -0.2796))
    ]
    
    var body: some View {
        VStack {
            // step 3: add locations on the map as annotations
            Map {
                ForEach(locations) { location in
                    Marker(location.name, coordinate: location.coordinate)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
