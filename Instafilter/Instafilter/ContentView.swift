//
//  ContentView.swift
//  Instafilter
//
//  Created by C3PO MBP on 18/12/24.
//

// step 1
import StoreKit
import SwiftUI

struct ContentView: View {
    // step 2: add a property to read review requester from SwiftUI's environment
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        // step 3: request the review when you're ready
        Button("Rate the app") {
            requestReview()
        }
    }
}

#Preview {
    ContentView()
}
