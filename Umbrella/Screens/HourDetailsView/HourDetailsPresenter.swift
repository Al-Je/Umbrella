//
//  HourDetailsPresenter.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 07/03/2022.
//

import Foundation

protocol HourDetailsPresenter: ObservableObject {
    var model: HourDetailsModel { get }
    
    func load()
}

final class HourDetailsPresenterImp: HourDetailsPresenter {
    @Published private(set) var model: HourDetailsModel = HourDetailsModel.defaultValue
    
    private let weatherData: WeatherData
    
    init(weatherData: WeatherData) {
        self.weatherData = weatherData
    }
    
    func load() {
        guard let mainWeatherDesc = weatherData.weather.first else { return }
        
        let pressurIndicator: InformationColorIndicator = weatherData.pressure > 1200 ? .red : .green
        let pressureInformation = HourDetailsModel.Information(title: "Pressure: \(weatherData.pressure)", indicator: pressurIndicator)
        
        let tempIndicator: InformationColorIndicator
        if weatherData.temp > 30 || weatherData.temp < 10 {
            tempIndicator = .red
        } else {
            tempIndicator = .green
        }
        let tempInformation = HourDetailsModel.Information(title: "Temperature: \(weatherData.temp)", indicator: tempIndicator)
        
        let windIndicator: InformationColorIndicator = weatherData.windSpeed > 150 ? .red : .green
        let windInformation = HourDetailsModel.Information(title: "wind speed: \(weatherData.windSpeed)", indicator: windIndicator)
        
        model = HourDetailsModel(
            imageURl: Api.Icon.url(name: mainWeatherDesc.icon),
            title: mainWeatherDesc.main,
            subtitle: mainWeatherDesc.description,
            informations: [
                pressureInformation,
                tempInformation,
                windInformation
            ]
        )
    }
}
