//
//  Location.swift
//  BucketList
//
//  Created by C3PO MBP on 26/12/24.
//

import Foundation

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
    /* we're using two variables for latitude and longitude instead of
     CLLocationCoordinate2D(), because it does not work with Codable */
}
