//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by C3PO MBP on 05/12/24.
//

import SwiftUI

@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    
    var name = "Wayne"
}

struct ContentView: View {
    var body: some View {
        Button("Encode Wayne", action: encodeWayne)
    }
    
    func encodeWayne() {
        // just for testing - not ideal code
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    ContentView()
}
