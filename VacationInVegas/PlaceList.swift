//
//  PlaceList.swift
//  VacationInVegas
//
//  Created by Mayur Vaity on 26/07/24.
//

import SwiftUI
import SwiftData

struct PlaceList: View {
    //@Query - to query and get data we got from model container linked to this
    //sort: \Place.name -  to sort by name of the place
    @Query(sort: \Place.name) private var places: [Place]
    
    //to manage showImages vw
    @State private var showImages = false
    
    var body: some View {
        //need navigation stack to add toolbar items
        NavigationStack {
            //looping through all the records in the data
            List(places) { place in
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
            //adding toolbar items (button),
            //to toggle showImages property, to open showImages vw
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    //to show "photo" systemImage as button 
                    Button("Show Images", systemImage: "photo") {
                        showImages.toggle()
                    }
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
    PlaceList()
        .modelContainer(Place.preview) //to use preview model container
}
