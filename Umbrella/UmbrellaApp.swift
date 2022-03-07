//
//  UmbrellaApp.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import SwiftUI

let useCombine = false

@main
struct UmbrellaApp: App {
    init() {
        configureNavigationBar()
    }
    
    var body: some Scene {
        WindowGroup {
            if useCombine {
                ScreensInjection.generateHourlyListViewWithCombine()
            } else {
                ScreensInjection.generateHourlyListViewWithAsync()
            }
        }
    }
    
    private func configureNavigationBar() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.accentColor)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.accentColor)]
    }
}
