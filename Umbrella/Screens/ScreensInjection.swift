//
//  ScreensInjection.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import Foundation

enum ScreensInjection {
    static func generateDaysListView() -> HourlyListView<HourlyListPresenterAsyncImp> {
        let repository = WeatherRepositoryAsyncImp()
        let presenter = HourlyListPresenterAsyncImp(asyncRepository: repository)
        let view = HourlyListView(presenter: presenter)
        return view
    }
}
