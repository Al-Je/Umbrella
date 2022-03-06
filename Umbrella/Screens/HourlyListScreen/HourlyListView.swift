//
//  HourlyListView.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import SwiftUI

struct HourlyListView<T>: View where T: HourlyListPresenter {
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
                    .navigationBarTitle("Loadings")
                    .tint(.accentColor)
                
            case .error(let error):
                VStack(alignment: .leading) {
                    Image(systemName: "arrow.clockwise")
                    Text(error.localizedDescription)
                }.onTapGesture {
                    presenter.load()
                }
                
            case .show(let items):
                List(items) { day in
                    HourCellView(model: day)
                }
                .refreshable {
                    await presenter.reload()
                }.onAppear {
                    UIRefreshControl.appearance().tintColor = UIColor(Color.accentColor)
                    UIRefreshControl.appearance().attributedTitle = try? NSAttributedString(markdown: "refreshing")
                }
                .navigationBarTitle("Hourly")
                .tint(.accentColor)
            }
        }
        
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
