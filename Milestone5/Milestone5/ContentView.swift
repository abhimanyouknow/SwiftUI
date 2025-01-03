//
//  ContentView.swift
//  Milestone5
//
//  Created by C3PO MBP on 02/01/25.
//

import MapKit
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \People.name) var people: [People]
    
    @State private var showingAddPerson = false
    
    let context = CIContext()
    let locationFetcher = LocationFetcher()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(people) { person in
                    NavigationLink(value: person) {
                        HStack {
                            Text(person.name)
                            
                            Spacer()
                            
                            Image(uiImage: UIImage(data: person.photo)!)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .scaledToFit()
                                .cornerRadius(20)
                        }
                    }
                }
            }
            .navigationTitle("Places+Faces")
            .navigationDestination(for: People.self) { person in
                DetailView(person: person)
            }
            .toolbar {
                Button {
                    showingAddPerson = true
                } label: {
                    Image(systemName: "plus.circle")
                    Text("Add")
                }
            }
            .sheet(isPresented: $showingAddPerson) {
                AddView(location: locationFetcher.lastKnownLocation ?? CLLocationCoordinate2D(latitude: 0, longitude: 0))
            }
            .onAppear() {
                locationFetcher.start()
            }
        }
    }
}

#Preview {
    ContentView()
}
