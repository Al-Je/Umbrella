//
//  UmbrellaApp.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import SwiftUI

@main
struct UmbrellaApp: App {
    init() {
        configureNavigationBar()
    }
    
    var body: some Scene {
        WindowGroup {
            ScreensInjection.generateHourlyListViewWithAsync()
            // ScreensInjection.generateHourlyListViewWithCombine()
        }
    }
    
    private func configureNavigationBar() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.accentColor)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.accentColor)]
    }
}
