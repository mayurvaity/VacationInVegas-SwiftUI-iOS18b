//
//  VegasChartView.swift
//  VacationInVegas
//
//  Created by Mayur Vaity on 28/07/24.
//

import SwiftUI
import Charts

//model of sample rating
struct SampleRating {
    let place: String
    let rating: Int
    
    //chart data
    static let ratings: [SampleRating] = [
        SampleRating(place: "Bellagio", rating: 88),
        SampleRating(place: "Paris", rating: 75),
        SampleRating(place: "Treasure Island", rating: 33),
        SampleRating(place: "Excalibur", rating: 99)
    ]
}

struct VegasChartView: View {
    var body: some View {
        //looping through each place for ratings
        Chart(SampleRating.ratings, id: \.place) { rating in
            //SectorMark - to create pie chart
            //angle - to specify value for each sectors of pie
            //angularInset - to split away pie pieces (visually)
            //innerRadius - to make it into a donut chart, and to specify size of the gap
            SectorMark(angle: .value("Ratings", rating.rating),
                       innerRadius: .ratio(0.5),
                       angularInset: 1
            )
            .cornerRadius(7) //to add corner radius at pie angles
            .foregroundStyle(by: .value("Place", rating.place)) //to assign diff colors to pies of the chart (based on place name prop)
        }
        .padding()
        .frame(height: 500)
    }
}

#Preview {
    VegasChartView()
}
