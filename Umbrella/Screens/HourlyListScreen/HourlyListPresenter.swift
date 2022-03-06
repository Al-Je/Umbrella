//
//  HourlyListPresenter.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import SwiftUI
import Combine

protocol HourlyListPresenter: ObservableObject {
    var state: HourlyListViewState { get }
    
    func load()
    func reload() async
}

final class HourlyListPresenterAsyncImp: HourlyListPresenter {
    @Published private(set) var state: HourlyListViewState = .idle
    
    private let asyncRepository: WeatherRepositoryAsync
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, hh:mm"
        return dateFormatter
    }()
    
    init(asyncRepository: WeatherRepositoryAsync) {
        self.asyncRepository = asyncRepository
    }
    
    func load() {
        state = .loading
        Task {
            await loadWithAsyncAwait()
        }
    }

    func reload() async {
        await loadWithAsyncAwait()
    }

    @MainActor
    private func loadWithAsyncAwait() async {
        do {
            let weatherResponse = try await asyncRepository.loadWeatherDatas()
            let items: [HourCellViewModel] = weatherResponse.hourly.compactMap { weatherData in
                guard let mainWeatherDesc = weatherData.weather.first else { return nil }
                
                let date = Date(timeIntervalSince1970: weatherData.dt)
                let title = dateFormatter.string(from: date)
                
                return HourCellViewModel(
                    imageURl: Api.Icon.url(name: mainWeatherDesc.icon),
                    title: title,
                    subtitle: mainWeatherDesc.description
                )
            }
            self.state = .show(items: items)
        } catch {
            state = .error(error)
        }
    }
}
