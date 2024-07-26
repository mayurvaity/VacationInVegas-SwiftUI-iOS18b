//
//  VacationInVegasApp.swift
//  VacationInVegas
//
//  Created by Mayur Vaity on 25/07/24.
//

import SwiftUI

@main
struct VacationInVegasApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //to specify to use real model container while running the app 
        .modelContainer(for: Place.self)
    }
}
