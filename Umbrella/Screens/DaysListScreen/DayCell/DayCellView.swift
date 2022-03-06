//
//  DayCellView.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 06/03/2022.
//

import SwiftUI

struct DayCellView: View {
    let model: DayCellViewModel
    
    var body: some View {
        return HStack {
            AsyncImage(url: URL(string: model.imageURl)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
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

struct DayCellView_Previews: PreviewProvider {
    static var previews: some View {
        DayCellView(
            model: DayCellViewModel(
                imageURl: "",
                title: "title",
                subtitle: "subtitle"
            )
        )
    }
}
