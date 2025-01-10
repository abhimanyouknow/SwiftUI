//
//  Prospect.swift
//  HotProspects
//
//  Created by C3PO MBP on 07/01/25.
//

import Foundation
import SwiftData

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    var addDate: Date // challenge 3 - part 1
    
    init(name: String, emailAddress: String, isContacted: Bool, addDate: Date) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
        self.addDate = addDate
    }
}
