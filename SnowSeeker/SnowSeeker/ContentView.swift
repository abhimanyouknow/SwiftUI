//
//  ContentView.swift
//  SnowSeeker
//
//  Created by C3PO MBP on 21/01/25.
//

import SwiftUI

struct ContentView: View {
    // challenge 3 - part 1
    enum SortOption: String, CaseIterable, Identifiable {
        case defaultOrder = "Default"
        case name = "Alphabetically"
        case country = "Country"
        
        var id: String { self.rawValue }
    }
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @State private var favourites = Favourites()
    @State private var searchText = ""
    // challenge 3 - part 2
    @State private var sortOption: SortOption = .defaultOrder
    
    var filteredResorts: [Resort] {
        // challenge 3 - part 3
        let sortedResorts: [Resort]
        switch sortOption {
        case .defaultOrder:
            sortedResorts = resorts
        case .name:
            sortedResorts = resorts.sorted(using: [SortDescriptor(\Resort.name)])
        case .country:
            sortedResorts = resorts.sorted(using: [SortDescriptor(\Resort.country), SortDescriptor(\Resort.name)])
        }
        
        if searchText.isEmpty {
            return sortedResorts
        } else {
            return sortedResorts.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(filteredResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(.rect(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favourites.contains(resort) {
                            Spacer()
                            
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favourite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
            // challenge 3 - part 4
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker("Sort by", selection: $sortOption) {
                            ForEach(SortOption.allCases) { option in
                                Text(option.rawValue).tag(option)
                            }
                        }
                    } label: {
                        Label("Sort", systemImage: "arrow.up.arrow.down")
                    }
                }
            }
        } detail: {
            WelcomeView()
        }
        .environment(favourites)
    }
}

#Preview {
    ContentView()
}
