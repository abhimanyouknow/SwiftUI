//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by C3PO MBP on 05/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var order = Order()
        /* this is the only place where we're creating an
         instance of the Order class.
         
         this instance will be passed to all other screens,
         so that they all work with the same instance
         */
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestsEnabled.animation())
                    
                    if order.specialRequestsEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Delivery Details") {
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}
