//
//  MockWeatherRepositoryAsync.swift
//  UmbrellaTests
//
//  Created by Alexandre Jegouic on 07/03/2022.
//

@testable import Umbrella
import XCTest

final class MockErrorWeatherRepositoryAsync: WeatherRepositoryAsync {
    func loadWeatherDatas() async throws -> WeatherResponse {
        throw ApiError.wrongPath
    }
}

final class MockDataWeatherRepositoryAsync: WeatherRepositoryAsync {
    func loadWeatherDatas() async throws -> WeatherResponse {
        return WeatherResponseData.loadResponse()!
    }
}

enum WeatherResponseData {
    static func loadResponse() -> WeatherResponse? {
        let bundle = Bundle(for: UmbrellaTests.self)
        if let url = bundle.url(forResource: "WeatherResponse", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url, options: NSData.ReadingOptions.uncached)
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode(WeatherResponse.self, from: data)
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
    
        XCTFail("Can't load Weather response from json file")
        return nil
    }
}
