//
//  SwiftUIView.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import SwiftUI



struct DaysListView<T>: View where T: DaysListPresenter {
    @ObservedObject private var presenter: T
    
    init(presenter: T) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            switch presenter.state {
            case .idle:
                Color.clear.onAppear {
                    presenter.load()
                }
                
            case .loading:
                ProgressView()
                
            case .error(let error):
                Text(error.localizedDescription)
                
            case .show(let items):
                List(items) { day in
                    DayCellView(model: day)
                }
                .refreshable {
                    await presenter.reload()
                }
            }
        }
        .navigationBarTitle("Days")
        .tint(.accentColor)
        .navigationViewStyle(.stack)
        
    }
}
/*
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DaysListView()
    }
}
*/
