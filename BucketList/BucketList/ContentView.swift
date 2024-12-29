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
    // challenge 1 - part 1
    @State private var mapStyle: MapStyle = .standard
    
    var body: some View {
        if viewModel.isUnlocked {
            ZStack {
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
                    // challenge 1 - part 2
                    .mapStyle(mapStyle)
                }
                
                // challenge 1 - part 3
                VStack {
                    Spacer()
                    
                    HStack(spacing: 20) {
                        Button("Standard") {
                            mapStyle = .standard
                        }
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                        
                        Button("Hybrid") {
                            mapStyle = .hybrid
                        }
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                    }
                }
            }
        } else {
            Button("Unlock palces", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
            
                // challenge 2 - part 3
                .alert("Authentication Failed", isPresented: $viewModel.showingUnlockError) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text(viewModel.unlockErrorMessage)
                }
        }
    }
}

#Preview {
    ContentView()
}
