//
//  VegasChartView.swift
//  VacationInVegas
//
//  Created by Mayur Vaity on 28/07/24.
//

import SwiftUI
import Charts

//model of sample trip rating
struct SampleTripRating {
    let trip: Int
    let rating: Int
    
    //chart data
    static let ratings: [SampleTripRating] = [
        SampleTripRating(trip: 1, rating: 55),
        SampleTripRating(trip: 2, rating: 27),
        SampleTripRating(trip: 3, rating: 67),
        SampleTripRating(trip: 4, rating: 72),
        SampleTripRating(trip: 5, rating: 81)
    ]
}

struct TripChartView: View {
    var body: some View {
        //looping through each trip rating for ratings
        Chart(SampleTripRating.ratings, id: \.trip) { rating in
            //to create a points chart
//            PointMark(
//                x: .value("Year", rating.trip),
//                y: .value("Rating", rating.rating)
//            )
            
            //to create a bar chart
            BarMark(
                x: .value("Year", rating.trip),
                y: .value("Rating", rating.rating)
            )
            
            //some prediction chart
            LinePlot(x: "Years", y: "Ratings") { x in
                return x * 6 + 50
            }
            .foregroundStyle(.purple) //color for line
        }
        .chartXScale(domain: 1...5) //x axis labels
        .chartYScale(domain: 1...100) //y axis labels
        .padding()
        
    }
}

#Preview {
    TripChartView()
}
