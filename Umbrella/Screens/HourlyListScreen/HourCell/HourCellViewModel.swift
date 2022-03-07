//
//  HourCellViewModel.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import SwiftUI

struct HourCellViewModel: Identifiable {
    let id = UUID()
    let imageURl: URL?
    let title: String
    let subtitle: String
    let detailDatas: WeatherData
}
