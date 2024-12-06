//
//  Order.swift
//  CupcakeCorner
//
//  Created by C3PO MBP on 06/12/24.
//

import Foundation

@Observable
class Order {
    static let types = ["Vanilla", "Strawberry", "Chocoalte", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestsEnabled = false {
        didSet {
            if specialRequestsEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
}
