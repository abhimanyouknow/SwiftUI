//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by C3PO MBP on 05/12/24.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        // step 1: create url we want to read from apple's servers
        guard let url = URL(string: "https://itunes.apple.com/search?term=j+cole&entity=song") else {
            print("Invalid URL")
            return
        }
        
        // step 2: featch data from that url
        // this is where the function sleep might happen
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
                /* the return value from this method is a
                 tuple, containing Data and metadata - since
                 the metadata is not of importance to us in
                 this instance, we're discarding it with _ */
            
            // step 3: decode the result into our response struct
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
