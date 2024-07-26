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
    
    //this is a preview container, this data doesn't get stored in swiftdata db
    @MainActor
    static var preview: ModelContainer {
        //isStoredInMemoryOnly - this data is stored in memory and not in swiftdata db
        let container = try! ModelContainer(for: Place.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        //putting below preview data into this model container, by looping through this array
        for place in previewPlaces {
            container.mainContext.insert(place)
        }
        
        //return the model container
        return container 
    }
    
    static var previewPlaces: [Place] {
        [
            Place(name: "Bellagio", latitude: 36.1129, longitude: -115.1765, interested: true),
            Place(name: "Paris", latitude: 36.1125, longitude: -115.1707, interested: true),
            Place(name: "Treasure Island", latitude: 36.1247, longitude: -115.1721, interested: false),
            Place(name: "Stratosphere", latitude: 36.1475, longitude: -115.1566, interested: false),
            Place(name: "Luxor", latitude: 36.0955, longitude: -115.1761, interested: false),
            Place(name: "Excalibur", latitude: 36.0988, longitude: -115.1754, interested: true)
        ]
    }
}
