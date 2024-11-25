//
//  ContentView.swift
//  Moonshot
//
//  Created by C3PO MBP on 25/11/24.
//

import SwiftUI

struct ContentView: View {
    // step 1: defining layout for the data
    let layout = [
        GridItem(.adaptive(minimum: 80)) // adaptive col with min size 80
    ]
    var body: some View {
        ScrollView(.horizontal) {
            // step 2: adding the LazyHGrid
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
