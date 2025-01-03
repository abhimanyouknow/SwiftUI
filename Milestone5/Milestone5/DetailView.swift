//
//  DetailView.swift
//  Milestone5
//
//  Created by C3PO MBP on 02/01/25.
//

import MapKit
import SwiftUI

struct DetailView: View {
    let person: People
    
    var body: some View {
        ScrollView {
            VStack {
                Image(uiImage: UIImage(data: person.photo)!)
                    .resizable()
                    .scaledToFit()
                    
                if person.latitude == nil && person.longitude == nil {
                    ContentUnavailableView("No location", systemImage: "location.slash.circle", description: Text("No location data available for \(person.name)"))
                } else {
                    Map() {
                        Annotation(person.name, coordinate: person.coordinate) {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundStyle(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(.circle)
                        }
                    }
                    .frame(width: 350, height: 400)
                    .cornerRadius(20)
                }
            }
            .padding()
        }
        .navigationTitle(person.name)
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(person: People(name: "John Doe", photo: Data(), latitude: 0, longitude: 0))
}
