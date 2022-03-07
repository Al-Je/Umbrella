//
//  UmbrellaTests.swift
//  UmbrellaTests
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import XCTest
import Combine
@testable import Umbrella

final class UmbrellaTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()

    func testWeatherResponseParsing() throws {
        let response = WeatherResponseData.loadResponse()!
        
        XCTAssertEqual(response.hourly[0].dt, 1586390400)
        XCTAssertEqual(response.hourly[0].temp, 278.41)
        XCTAssertEqual(response.hourly[0].pressure, 1006)
        XCTAssertEqual(response.hourly[0].windSpeed, 9.83)
        XCTAssertEqual(response.hourly[0].weather[0].description, "clear sky")
        XCTAssertEqual(response.hourly[0].weather[0].main, "Clear")
        XCTAssertEqual(response.hourly[0].weather[0].icon, "01n")
    }

    func testPresenterError() {
        let presenter = HourlyListPresenterAsyncImp(asyncRepository: MockErrorWeatherRepositoryAsync())
        presenter.load()
        
        let expectation = XCTestExpectation(description: "waiting state change")
        
        presenter.$state.dropFirst().sink { _ in
            expectation.fulfill()
        }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1)
        
        if case .error = presenter.state {} else {
            XCTFail("wrong state, we should have the error state ")
        }
    }
    
    func testPresenterDate() {
        let presenter = HourlyListPresenterAsyncImp(asyncRepository: MockDataWeatherRepositoryAsync())
        presenter.load()
        
        let expectation = XCTestExpectation(description: "waiting state change")
        presenter.$state.dropFirst().sink { _ in
            expectation.fulfill()
        }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1)
        
        if case .show(let items) = presenter.state {
            XCTAssertEqual(items.count, 3)
            XCTAssertEqual(items[0].subtitle, "clear sky")
        } else {
            XCTFail("wrong state, we should have the error state ")
        }
    }
}
