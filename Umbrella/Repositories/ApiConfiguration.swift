//
//  ApiConfiguration.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import Foundation

enum Api {
    enum Configuration {
        static let apiKey = "8c2b26e4338a440318cd82851e6f0ed3"
        static let pathWeatherRequest = "https://api.openweathermap.org/data/2.5/onecall"
        static let lat = "48.856614"
        static let lon = "2.3522219"
    }
    
    enum Params {
        static let lat = "lat"
        static let lon = "lon"
        static let apiKey = "appid"
    }
    
    enum Icon {
        static let path = "https://openweathermap.org/img/wn/"
        static let exten = "@2x.png"
        
        static func url(name: String) -> URL? {
            return URL(string: path + name + exten)
        }
    }
    
    static func generateWeatherUrl() throws -> URL? {
        guard var components = URLComponents(string: Api.Configuration.pathWeatherRequest) else { throw ApiError.wrongPath }
        
        components.queryItems = [
            URLQueryItem(name: Api.Params.lat, value: Api.Configuration.lat),
            URLQueryItem(name: Api.Params.lon, value: Api.Configuration.lon),
            URLQueryItem(name: Api.Params.apiKey, value: Api.Configuration.apiKey)
        ]
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        return components.url
    }
}
