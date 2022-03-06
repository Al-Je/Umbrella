//
//  DayCellViewModel.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import SwiftUI

struct DayCellViewModel: Identifiable {
    let id = UUID()
    let imageURl: String
    let title: String
    let subtitle: String
}
