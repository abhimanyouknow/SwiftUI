//
//  Location.swift
//  BucketList
//
//  Created by C3PO MBP on 26/12/24.
//

import Foundation
import MapKit

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
    /* we're using two variables for latitude and longitude instead of
     CLLocationCoordinate2D(), because it does not work with Codable */
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    #if DEBUG
    static let example = Location(id: UUID(), name: "Old Trafford", description: "Home stadium of Manchester United Football Club", latitude: 53.4631, longitude: -2.2913)
    #endif
    
    /* creating custom == method to check if two locations are the same. since our struct
     conforms to Equatable, it creates a custom method which checks for member-wise
     properties when checking if two Location instances are the same.
        
     In our case, since we're using id as UUID, we don't necessarily need a custom
     method but we've added one just to see how it's done
     */
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
