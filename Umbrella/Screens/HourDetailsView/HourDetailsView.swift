//
//  HourDetailsView.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 07/03/2022.
//

import SwiftUI

struct HourDetailsView<T>: View where T: HourDetailsPresenter {
    @ObservedObject private var presenter: T
    
    init(presenter: T) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView() {
            VStack(alignment: .leading) {
                HStack {
                    AsyncImage(url: presenter.model.imageURl) { image in
                        image.resizable()
                    } placeholder: {
                        Image("AppLogo").resizable()
                    }
                    .frame(width: 50, height: 50)
                    VStack(alignment: .leading) {
                        Text(presenter.model.title)
                        Text(presenter.model.subtitle)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                VStack {
                    ForEach(presenter.model.informations) { information in
                        HourOneDetailView(model: information)
                    }
                }
                Spacer()
            }
            
            .tint(.accentColor)
            .padding()
            .navigationBarTitle("Details informations")
            .onAppear {
                presenter.load()
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct HourDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HourDetailsView(presenter: MockHourDetailsPresenter())
    }
}
