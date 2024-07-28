//
//  ContentView.swift
//  VacationInVegas
//
//  Created by Mayur Vaity on 25/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            //places tab
            Tab("Places", systemImage: "photo") {
                PlaceListView()
            }
            
            //trip history tab
            Tab("Trip History", systemImage: "chart.line.uptrend.xyaxis") {
                TripChartView()
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
        .modelContainer(Place.preview) //need to pass preview data container
    //while running the app, it will get data passed in modelcontainer at "VacationInVegasApp" file
}
