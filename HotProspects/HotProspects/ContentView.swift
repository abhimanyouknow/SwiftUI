//
//  ContentView.swift
//  HotProspects
//
//  Created by C3PO MBP on 04/01/25.
//

import SamplePackage
import SwiftUI

struct ContentView: View {
    let possibleNumbers = 1...60
    
    var result: String {
        let selected = possibleNumbers.random(7).sorted()
            /* we're using the .random() method extension from the
             SamplePackage that we imported */
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    
    var body: some View {
        Text(result)
    }
}

#Preview {
    ContentView()
}
