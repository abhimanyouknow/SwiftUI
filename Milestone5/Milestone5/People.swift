//
//  People.swift
//  Milestone5
//
//  Created by C3PO MBP on 02/01/25.
//

import Foundation
import MapKit
import SwiftData

@Model
class People {
    var id = UUID()
    var name: String
    @Attribute(.externalStorage) var photo: Data
    
    var latitude: Double?
    var longitude: Double?
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude ?? 0, longitude: longitude ?? 0)
    }
    
    init(id: UUID = UUID(), name: String, photo: Data, latitude: Double?, longitude: Double?) {
        self.id = id
        self.name = name
        self.photo = photo
        self.latitude = latitude
        self.longitude = longitude
    }
}
