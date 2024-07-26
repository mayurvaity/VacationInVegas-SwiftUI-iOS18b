//
//  Place.swift
//  VacationInVegas
//
//  Created by Mayur Vaity on 26/07/24.
//

import SwiftUI
import SwiftData
import MapKit

//@Model - to create a swiftdata model
@Model
class Place {
    //to create PK based on more than one column (just an example)
//    #Unique<Place>([\.name, \.latitude, \.longitude])
    
    //@Attribute(.unique) -  to make name PK of this table (Data model)
    @Attribute(.unique) var name: String
    var latitude: Double
    var longitude: Double
    var interested: Bool
    
    //computed properties
    //to create location property using lat and lon.
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    //to create image property using name
    var image: Image {
        //forming image name same as ones in assets, by lower casing and removing spaces
        //then returning image from assets 
        Image(name.lowercased().replacingOccurrences(of: " ", with: ""))
    }
    
    init(name: String, latitude: Double, longitude: Double, interested: Bool) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.interested = interested
    }
}
