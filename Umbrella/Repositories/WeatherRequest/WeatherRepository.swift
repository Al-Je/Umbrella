//
//  WeatherRepository.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import Foundation
import Combine

enum ApiError: LocalizedError {
    case wrongPath
    
    var errorDescription: String? {
        switch self {
        case .wrongPath:
            return "Wrong url"
        }
    }
}

// repository with async await
protocol WeatherRepositoryAsync {
    func loadWeatherDatas() async throws -> WeatherResponse
}

final class WeatherRepositoryAsyncImp: WeatherRepositoryAsync {
    func loadWeatherDatas() async throws -> WeatherResponse {
        guard let url = try Api.generateWeatherUrl() else { throw ApiError.wrongPath }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(WeatherResponse.self, from: data)
    }
}

// repository withcombine
protocol WeatherRepositoryCombine {
    func weatherDatasPublisher() throws -> AnyPublisher<WeatherResponse, Error>
}

final class WeatherRepositoryCombineImp: WeatherRepositoryCombine {
    func weatherDatasPublisher() -> AnyPublisher<WeatherResponse, Error> {
        guard let url = try? Api.generateWeatherUrl() else {
            return Fail(error: ApiError.wrongPath).eraseToAnyPublisher()
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode( type: WeatherResponse.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
