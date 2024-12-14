//
//  Job.swift
//  SwiftDataProject
//
//  Created by C3PO MBP on 14/12/24.
//

import Foundation
import SwiftData

@Model
class Job {
    var name: String
    var prioirty: Int
    var owner: User? // linking the Job model to the User model
    
    init(name: String, prioirty: Int, owner: User? = nil) {
        self.name = name
        self.prioirty = prioirty
        self.owner = owner
    }
}
