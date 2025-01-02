//
//  People.swift
//  Milestone5
//
//  Created by C3PO MBP on 02/01/25.
//

import Foundation
import SwiftData

@Model
class People {
    var id = UUID()
    var name: String
    @Attribute(.externalStorage) var photo: Data
    
    init(name: String, photo: Data) {
        self.name = name
        self.photo = photo
    }
}
