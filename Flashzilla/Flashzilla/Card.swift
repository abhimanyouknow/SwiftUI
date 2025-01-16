//
//  Card.swift
//  Flashzilla
//
//  Created by C3PO MBP on 13/01/25.
//

import Foundation

// challenge 3 - part 1
struct Card: Codable, Identifiable {
    var id = UUID()
    var prompt: String
    var answer: String
    
    static let example = Card(prompt: "Who played the 13th doctor in Doctor Who?", answer: "Jodie Whittaker")
}
