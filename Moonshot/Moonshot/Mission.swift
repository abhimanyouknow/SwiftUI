//
//  Mission.swift
//  Moonshot
//
//  Created by C3PO MBP on 26/11/24.
//

import Foundation

struct Mission: Codable, Identifiable {
    // nested struct - since CrewRole is only to be used with Mission struct
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date? // optional because not all Mission objects have launch date
    let crew: [CrewRole]
    let description: String
    
    // adding two computed properties which will be used to in the ContentView
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
