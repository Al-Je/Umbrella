//
//  WeatherResponse.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import Foundation

struct WeatherResponse: Codable {
    let hourly: [WeatherData]
}

struct WeatherData: Codable {
    let dt: TimeInterval
    let temp: Double
    let pressure: Double
    let weather: [WeatherDescription]
    let windSpeed: Double
}

struct WeatherDescription: Codable {
    let main: String
    let description: String
    let icon: String
}
