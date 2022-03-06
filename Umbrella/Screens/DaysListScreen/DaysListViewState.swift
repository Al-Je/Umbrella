//
//  DaysListViewState.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

enum DaysListViewState {
    case idle
    case loading
    case error(Error)
    case show(items: [DayCellViewModel])
}
