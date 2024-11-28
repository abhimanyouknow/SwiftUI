//
//  CustomDividerView.swift
//  Moonshot
//
//  Created by C3PO MBP on 28/11/24.
//

/* challenge 2 - part 2.3
 moving out custom divider to a new SwiftUI View */

import SwiftUI

struct CustomDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDividerView()
}
