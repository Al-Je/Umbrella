//
//  PreviewMockHourlyPresenter.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 07/03/2022.
//

import Foundation

final class MockLoadingHourlyListPresenter: HourlyListPresenter {
    @Published private(set) var state: HourlyListViewState = .idle
 
    func load() {
        state = .loading
    }
    
    func reload() async {
        state = .loading
    }
}

final class MockErrorHourlyListPresenter: HourlyListPresenter {
    @Published private(set) var state: HourlyListViewState = .idle
 
    func load() {
        state = .error(NSError(domain: "mockError", code: 0, userInfo: nil))
    }
    
    func reload() async {
        state = .error(NSError(domain: "mockError", code: 0, userInfo: nil))
    }
}

final class MockContentHourlyListPresenter: HourlyListPresenter {
    @Published private(set) var state: HourlyListViewState = .idle
 
    func load() {
        state = .show(items: [
            HourCellViewModel(imageURl: nil, title: "title mock 1", subtitle: "subtitle mock 1"),
            HourCellViewModel(imageURl: nil, title: "title mock 2", subtitle: "subtitle mock 2"),
            HourCellViewModel(imageURl: nil, title: "title mock 3", subtitle: "subtitle mock 3"),
            HourCellViewModel(imageURl: nil, title: "title mock 4", subtitle: "subtitle mock 4")
        ])
    }
    
    func reload() async {
        state = .show(items: [
            HourCellViewModel(imageURl: nil, title: "title mock 1", subtitle: "subtitle mock 1"),
            HourCellViewModel(imageURl: nil, title: "title mock 2", subtitle: "subtitle mock 2"),
            HourCellViewModel(imageURl: nil, title: "title mock 3", subtitle: "subtitle mock 3"),
            HourCellViewModel(imageURl: nil, title: "title mock 4", subtitle: "subtitle mock 4")
        ])
    }
}
