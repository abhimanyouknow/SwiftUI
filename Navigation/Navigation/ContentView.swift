//
//  ContentView.swift
//  Navigation
//
//  Created by C3PO MBP on 29/11/24.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    @Binding var path: [Int] // Binding property for shared path
    /* if we were using a NavigationPath property as path -
     III -
     
     @Binding var path: NavigationPath
     */

    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path.removeAll() /* using the shared path
                                      property to reset the
                                      array, this going back
                                      to the root view */
                    /* if we were using a NavigationPath
                     property as path - II -
                     
                     path = NavigationPath()
                     */
                }
            }
    }
}

struct ContentView: View {
    @State private var path = [Int]()
    /* if we were using a NavigationPath property as path - I -
     @State private var path = NavigationPath()
     */
    
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    ContentView()
}
