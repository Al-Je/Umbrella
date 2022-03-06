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

        Task {
            await loadData()
        }
    }

    func reload() async {
        await loadData()
    }

    private func loadData() async {
        
    }
}
