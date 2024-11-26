//
//  Color-Theme.swift
//  Moonshot
//
//  Created by C3PO MBP on 26/11/24.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    /* extending ShapeStyle instead of Color so that we can use other properties of
     ShapeStyle like .ultraThinMaterial, etc.
     
     But, we'll be using this extension only on Color, whereever ShapeStyle is used
     */
    
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
