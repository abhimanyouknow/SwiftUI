//
//  ContentView.swift
//  Moonshot
//
//  Created by C3PO MBP on 25/11/24.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    var body: some View {
        Button("Decode JSON") {
            // sample input data
            let input = """
            {
                "name": "Wayne Rooney",
                "address": {
                    "street": "Old Trafford Road",
                    "city": "Manchester"
                }
            }
            """
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

#Preview {
    ContentView()
}
