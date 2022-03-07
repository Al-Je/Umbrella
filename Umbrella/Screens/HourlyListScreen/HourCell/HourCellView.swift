//
//  HourCellView.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import SwiftUI

struct HourCellView: View {
    let model: HourCellViewModel
    
    var body: some View {
        return NavigationLink(destination: ScreensInjection.generateHourDetailsView(weatherData: model.detailDatas)) {
            HStack {
                AsyncImage(url: model.imageURl) { image in
                    image.resizable()
                } placeholder: {
                    Image("AppLogo").resizable()
                }
                .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text(model.title)
                    Text(model.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct DayCellView_Previews: PreviewProvider {
    static var previews: some View {
        HourCellView(
            model: HourCellViewModel(
                imageURl: URL(string: ""),
                title: "title",
                subtitle: "subtitle",
                detailDatas: WeatherData(
                    dt: 353253,
                    temp: 237.5,
                    pressure: 1000,
                    weather: [],
                    windSpeed: 150
                )
            )
        )
    }
}
