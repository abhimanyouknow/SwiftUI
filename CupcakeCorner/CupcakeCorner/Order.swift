//
//  Order.swift
//  CupcakeCorner
//
//  Created by C3PO MBP on 06/12/24.
//

import Foundation

// challenge 1 - part 1
// creating an extension to remove white spaces and new lines from a string
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestsEnabled = "specialRequestsEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _streetAddress = "streetAddress"
        case _city = "city"
        case _zip = "zip"
    }
    
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
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        // challenge 1 - part 2
        if name.trimmed().isEmpty || streetAddress.trimmed().isEmpty || city.trimmed().isEmpty || zip.trimmed().isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Decimal {
        // $2 per cake
        var cost = Decimal(quantity) * 2
        
        // complicated cakes cost more
        cost += Decimal(type) / 2
        
        // $1 per cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        // $0.50 per cake for sprinkles option
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
}
