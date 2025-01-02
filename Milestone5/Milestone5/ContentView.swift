//
//  ContentView.swift
//  Milestone5
//
//  Created by C3PO MBP on 02/01/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \People.name) var people: [People]
    
    @State private var showingAddPerson = false
    
    let context = CIContext()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(people) { person in
                    NavigationLink(value: person) {
                        HStack {
                            Text(person.name)
                            
                            Spacer()
                            
                            Image(uiImage: UIImage(data: person.photo)!)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .scaledToFit()
                        }
                    }
                }
            }
            .navigationTitle("Places+Faces")
            .navigationDestination(for: People.self) { person in
                DetailView(person: person)
            }
            .toolbar {
                Button {
                    showingAddPerson = true
                } label: {
                    Image(systemName: "plus.circle")
                    Text("Add")
                }
            }
            .sheet(isPresented: $showingAddPerson) {
                AddView()
            }
        }
    }
}

#Preview {
    ContentView()
}
