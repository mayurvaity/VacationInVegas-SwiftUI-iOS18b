//
//  MapView.swift
//  VacationInVegas
//
//  Created by Mayur Vaity on 27/07/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    //to keep place data got from parent vw
    var place: Place
    
    //obj to specify camera angle and distance for vwing abv place
    @State var position: MapCameraPosition
    
    var body: some View {
        //$ sign allows position to be changed while interacting with it
        Map(position: $position) {
            //to add annotation (some text) in the map
            Annotation(place.interested ? "Place of Interest" : "Not Interested", coordinate: place.location) {
                ZStack {
                    RoundedRectangle(cornerRadius: 7)
                        .fill(.ultraThickMaterial) //slightly transparent color
                        .stroke(.secondary, lineWidth: 5) //to add border like around this
                    Image(systemName: place.interested ? "face.smiling" : "hand.thumbsdown")
                        .padding(5)
                }
                //to change the interested prop when tapped on this zstack 
                .onTapGesture {
                    place.interested.toggle()
                }
            }
        }
        .toolbarBackgroundVisibility(.automatic) //to remove white bg of navbar when opening this vw 
    }
}

#Preview {
    //now a state prop can be created in the preview using @Previewable
    @Previewable @State var place = Place.previewPlaces[4]
    
    MapView(place: place,
            position: .camera(MapCamera(
                centerCoordinate: place.location,
                distance: 1000, //camera position to be 1000ft abv ground
                heading: 250, //angle from which u wanna be looking at it from
                pitch: 80 //another thing to be with angle
            )))
}
