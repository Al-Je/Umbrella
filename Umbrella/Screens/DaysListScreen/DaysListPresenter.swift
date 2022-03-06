//
//  DaysListPresenter.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import SwiftUI
import Combine

protocol DaysListPresenter: ObservableObject {
    var state: DaysListViewState { get }
    
    func load()
    func reload() async
}


final class ListPresenterImp: DaysListPresenter {
    @Published var state: DaysListViewState = .idle

    func load() {
        state = .loading
        loadData()
    }

    func reload() async {
        loadData()
    }

    private func loadData() {
        /*Task {
            await loadData()
        }*/
    }
}
