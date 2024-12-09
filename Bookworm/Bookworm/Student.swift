//
//  Student.swift
//  Bookworm
//
//  Created by C3PO MBP on 09/12/24.
//

// step 1: define the data we want to use in our app

import Foundation
import SwiftData // step 1 - part 1

@Model // step 1 - part 2
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
