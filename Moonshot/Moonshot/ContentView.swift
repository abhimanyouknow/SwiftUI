//
//  ContentView.swift
//  Moonshot
//
//  Created by C3PO MBP on 25/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }
            //.frame(maxWidth: .infinity)
                // needed only with regular VStack/HStack
        }
    }
}

#Preview {
    ContentView()
}
