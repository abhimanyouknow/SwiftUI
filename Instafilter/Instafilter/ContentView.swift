//
//  ContentView.swift
//  Instafilter
//
//  Created by C3PO MBP on 18/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Lear Swift here"), message: Text("Check out the 100 days of SwiftUI")) {
            Label("Spread the word about Swift", systemImage: "swift")
        }
    }
}

#Preview {
    ContentView()
}
