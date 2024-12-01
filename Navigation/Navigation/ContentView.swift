//
//  ContentView.swift
//  Navigation
//
//  Created by C3PO MBP on 29/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) {
                Text("Row \($0)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
                /* palces nav bar title in small text at the
                 top-centre of the screen */
            .toolbarBackground(.blue, for: .navigationBar)
                /* the blue background of the nav title only
                 appears when we scroll down a little bit */
            .toolbarColorScheme(.dark, for: .navigationBar)
                /* changes the text color of the title to
                 white when user scrolls the list and the
                 background turns blue */
            .toolbar(.hidden, for: .navigationBar)
                /* hiding the nav bar containing the title,
                 while retaining the functionality of
                 navigating to different views */
        }
    }
}

#Preview {
    ContentView()
}
