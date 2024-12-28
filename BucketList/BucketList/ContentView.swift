//
//  ContentView.swift
//  BucketList
//
//  Created by C3PO MBP on 24/12/24.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        MapReader { proxy in
            Map() {
                ForEach(viewModel.locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(.circle)
                            .simultaneousGesture(
                                LongPressGesture(minimumDuration: 0.5)
                                    .onEnded { _ in
                                        viewModel.selectedPlace = location
                                    }
                            )
                    }
                }
            }
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local) {
                    viewModel.addLocation(at: coordinate)
                }
            }
            .sheet(item: $viewModel.selectedPlace) { place in
                EditView(location: place) {
                    viewModel.updateLocation(location: $0)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
