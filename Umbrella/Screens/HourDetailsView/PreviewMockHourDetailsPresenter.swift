//
//  PreviewMockHourDetailsPresenter.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 07/03/2022.
//

import Foundation

final class MockHourDetailsPresenter: HourDetailsPresenter {
    @Published private(set) var model: HourDetailsModel = HourDetailsModel.defaultValue
    func load() {
        model = HourDetailsModel(
            imageURl: nil,
            title: "title",
            subtitle: "subtitle",
            informations: [
                HourDetailsModel.Information(title: "Pressure: 1000", indicator: .red),
                HourDetailsModel.Information(title: "Temperature: 20", indicator: .green),
                HourDetailsModel.Information(title: "wind speed: 20", indicator: .green)
            ]
        )
    }
}
