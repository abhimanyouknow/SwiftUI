//
//  ContentView.swift
//  SnowSeeker
//
//  Created by C3PO MBP on 21/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            Text("Primary")
        } detail: {
            Text("Content")
        }
    }
}

#Preview {
    ContentView()
}
