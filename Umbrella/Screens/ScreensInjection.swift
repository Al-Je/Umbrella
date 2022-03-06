//
//  ScreensInjection.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import Foundation

enum ScreensInjection {
    static func generateHourlyListViewWithAsync() -> HourlyListView<HourlyListPresenterAsyncImp> {
        let repository = WeatherRepositoryAsyncImp()
        let presenter = HourlyListPresenterAsyncImp(asyncRepository: repository)
        let view = HourlyListView(presenter: presenter)
        return view
    }
    
    static func generateHourlyListViewWithCombine() -> HourlyListView<HourlyListPresenterCombineImp> {
        let repository = WeatherRepositoryCombineImp()
        let presenter = HourlyListPresenterCombineImp(combineRepository: repository)
        let view = HourlyListView(presenter: presenter)
        return view
    }
}
