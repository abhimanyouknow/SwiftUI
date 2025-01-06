//
//  ContentView.swift
//  HotProspects
//
//  Created by C3PO MBP on 04/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("Wayne Rooney")
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        print("Deleted")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinned")
                    }
                    .tint(.orange)
                }
        }
    }
}

#Preview {
    ContentView()
}
