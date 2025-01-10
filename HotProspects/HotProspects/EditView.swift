//
//  EditView.swift
//  HotProspects
//
//  Created by C3PO MBP on 10/01/25.
//

// challenge 2 - part 1

import SwiftUI

struct EditView: View {
    @Bindable var prospect: Prospect
    
    var body: some View {
        Form {
            TextField("Name", text: $prospect.name)
            TextField("Email Address", text: $prospect.emailAddress)
            Text("Details added on: \(prospect.addDate.formatted())")
                .foregroundStyle(.secondary) // challenge 3 - part 2
        }
    }
}

#Preview {
    EditView(prospect: Prospect(name: "Wayne Rooney", emailAddress: "w.rooney@manutd.com", isContacted: false, addDate: Date.now))
}
