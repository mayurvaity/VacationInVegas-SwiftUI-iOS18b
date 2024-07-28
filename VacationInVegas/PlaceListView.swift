//
//  PlaceList.swift
//  VacationInVegas
//
//  Created by Mayur Vaity on 26/07/24.
//

import SwiftUI
import SwiftData
import MapKit

struct PlaceListView: View {
    //@Query - to query and get data we got from model container linked to this
    //sort: \Place.name -  to sort by name of the place
    @Query(sort: \Place.name) private var places: [Place]
    
    //to manage showImages vw
    @State private var showImages = false
    
    //var to store search text from search bar
    @State private var searchText = ""
    //var to manage interested filter
    @State private var filterByInterested = false
    
    //namespace id to be used in transition from nav link to destination vw
    @Namespace var namespace
    
    //predicate - is a filter
    private var predicate: Predicate<Place> {
        #Predicate<Place> {
            if !searchText.isEmpty && filterByInterested {
                //if seraching something as well as interested filter is applied
                $0.name.localizedStandardContains(searchText) && $0.interested
            } else if !searchText.isEmpty {
                //if interested filter is not applied and searching something
                $0.name.localizedStandardContains(searchText)
            } else if searchText.isEmpty && filterByInterested {
                //when only interested filter is applied and not searching anything
                $0.interested
            } else {
                //if there is no filter at all (showing all)
                true
            }
        }
    }
    
    var body: some View {
        //need navigation stack to add toolbar items
        NavigationStack {
            //looping through all the records in the data
            //filter - getting data by applying filters (predicate)
            //if it returns nil then taking all the dta from "places" obj
            List((try? places.filter(predicate)) ?? places) { place in
                //NavigationLink - to make rows in the list clickable
                NavigationLink(value: place) {
                    HStack {
                        //hotel image
                        place.image
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 7))
                            .frame(width: 100, height: 100)
                        
                        //hotel name
                        Text(place.name)
                        
                        Spacer()
                        
                        //star to indicate interested place
                        if place.interested {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                                .padding(.trailing)
                        }
                    }
                }
                //for animation on tapping any of the nav link (pt 1)
                .matchedTransitionSource(id: 1, in: namespace)
                //swipe right to change interested property
                .swipeActions(edge: .leading) {
                    //name of the button based on interested prop 
                    Button(place.interested ? "Interested" : "Not Interested", systemImage: "star") {
                        place.interested.toggle()
                    }
                    .tint(place.interested ? .yellow : .gray) //color based on interested prop
                }
            }
            //to add navigation title
            .navigationTitle("Places")
            //to add search bar
            .searchable(text: $searchText, prompt: "Find a place")
            //to apply animation while filtering list
            .animation(.default, value: searchText)
            //navigationDestination - to specify which vw to open when clicked on a row in nav stack
            //for - to specify obj type we receive when tapped on a row
            .navigationDestination(for: Place.self) { place in
                //to show mapView
                MapView(place: place,
                        position: .camera(MapCamera(
                            centerCoordinate: place.location,
                            distance: 1000, //camera position to be 1000ft abv ground
                            heading: 250, //angle from which u wanna be looking at it from
                            pitch: 80 //another thing to be with angle
                        ))
                )
                //for animation on tapping any of the nav link (pt 2)
                .navigationTransition(.zoom(sourceID: 1, in: namespace))
            }
            //adding toolbar items (button),
            //to toggle showImages property, to open showImages vw
            .toolbar {
                //show images button on nav bar
                ToolbarItem(placement: .topBarTrailing) {
                    //to show "photo" systemImage as button
                    Button("Show Images", systemImage: "photo") {
                        showImages.toggle()
                    }
                }
                
                //interested button on nav bar
                ToolbarItem(placement: .topBarLeading) {
                    Button("filter interested", systemImage: filterByInterested ? "star.fill" : "star") {
                        filterByInterested.toggle()
                    }
                    .tint(filterByInterested ? .yellow : .blue) //to apply modifn on button, when tapped change to yellow else keep the same
                }
            }
            //to show Scrolling vw in Modal vw when abv button is tapped, based on $showImages var
            .sheet(isPresented: $showImages) {
                Scrolling()
            }
        }
    }
}

#Preview {
    PlaceListView()
        .modelContainer(Place.preview) //to use preview model container
}
