//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by C3PO MBP on 17/01/25.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@abhimanyouknow")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]
                    }
                
                Image(.abhimanyu)
                    .resizable()
                    .frame(width: 64, height: 84)
            }
            
            VStack {
                Text("Name:")
                
                Text("Abhimanyu")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]
                    }
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ContentView()
}
