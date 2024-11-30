//
//  ContentView.swift
//  Navigation
//
//  Created by C3PO MBP on 29/11/24.
//

import SwiftUI

struct ContentView: View {
    /* property to store the path for the navigation we're
     working with */
    @State private var path = [Int]()
    
    var body: some View {
        /* binding nav stack's path to our property
         any change to the path array becomes the active path
         for our nav stack - since this is using two-way
         binding, the path array stays updated (in sync) with
         our view
         */
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                    /* this will reset the nav stack, which
                     will then navigatte to path 32 */
                }
                
                Button("Show 64") {
                    path.append(64)
                    /* this will leave the existing nav stack
                     as it is, and then navigate to path 64 */
                }
                
                Button("Show 32 then 64") {
                    path = [32, 64]
                    /* this changes the whole array - meaning
                     nav stack resets to root view, then
                     navigates to path 32, then navigates to
                     path 64 */
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("Your selection: \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
