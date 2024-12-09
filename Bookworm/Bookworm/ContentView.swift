//
//  ContentView.swift
//  Bookworm
//
//  Created by C3PO MBP on 09/12/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
        /* we're reading out from the environment and the
         modelContainer modifier from earlier place the main
         context in there for us to work with */
    @Query var students: [Student]
        /* the @Query property wrapper tells swift to look for
         the main context based on what was placed into the
         environment earlier, then queries the container
         through that main context and finds it. we get all the
         Student data from memory here, and it'll watch them
         for updates so if the array changes, it'll re-invoke
         the body property & make the view update as well */
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                /* button that generates random student info
                 and saves them in our modelContext */
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Herminoe", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    
                    /* asking our modelContext to add this
                     student to our storage - which means it'll
                     be queued up for saving asap */
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
