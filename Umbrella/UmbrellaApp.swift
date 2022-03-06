//
//  UmbrellaApp.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import SwiftUI

@main
struct UmbrellaApp: App {
    
    var body: some Scene {
        WindowGroup {
            ScreensInjection.generateDaysListView()
        }
    }
}
