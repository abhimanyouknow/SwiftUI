//
//  ContentView.swift
//  Navigation
//
//  Created by C3PO MBP on 29/11/24.
//

import SwiftUI

// custom struct
struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                // step 1
                NavigationLink("Select \(i)", value: i)
            }
            // step 2
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
            
            // nav destination for Student
            .navigationDestination(for: Student.self) { student in
                Text("You selected \(student.name)")
            }
        }
    }
}

#Preview {
    ContentView()
}
