//
//  ContentView.swift
//  SnowSeeker
//
//  Created by C3PO MBP on 21/01/25.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Abhimanyu")
            Text("Country: India")
            Text("Pets: Mitthu")
        }
        .font(.title)
    }
}

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        if horizontalSizeClass == .compact {
            VStack {
                UserView()
            }
        } else {
            HStack {
                UserView()
            }
        }
    }
}

#Preview {
    ContentView()
}
