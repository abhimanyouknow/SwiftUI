//
//  Favourites.swift
//  SnowSeeker
//
//  Created by C3PO MBP on 24/01/25.
//

import SwiftUI

@Observable
class Favourites {
    private var resorts: Set<String>
    private let key = "Favourites"
    
    init() {
        // challenge 2 - part 1
        if let data = UserDefaults.standard.data(forKey: key) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                self.resorts = decoded
                return
            }
        }
        
        // if unable to decode, return empty array
        self.resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        // challenge 2 - part 2
        if let resortsData = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(resortsData, forKey: key)
        } else {
            fatalError("Unable to save data")
        }
    }
}
