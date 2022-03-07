//
//  HourDetailsModel.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 07/03/2022.
//

import SwiftUI

struct HourDetailsModel {
    struct Information: Identifiable {
        let id = UUID()
        let title: String
        let indicator: InformationColorIndicator
    }
    
    let imageURl: URL?
    let title: String
    let subtitle: String
    let informations: [Information]
    
    static let defaultValue = HourDetailsModel(
        imageURl: nil,
        title: "",
        subtitle: "",
        informations: []
    )
}

enum InformationColorIndicator {
    case green
    case red
    
    var color: Color {
        switch self {
        case .green:
            return Color.green
        case .red:
            return Color.red
        }
    }
}
