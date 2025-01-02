//
//  DetailView.swift
//  Milestone5
//
//  Created by C3PO MBP on 02/01/25.
//

import SwiftUI

struct DetailView: View {
    let person: People
    
    var body: some View {
        Image(uiImage: UIImage(data: person.photo)!)
            .resizable()
            .scaledToFit()
            .padding()
            .navigationTitle(person.name)
            .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(person: People(name: "John Doe", photo: Data()))
}
