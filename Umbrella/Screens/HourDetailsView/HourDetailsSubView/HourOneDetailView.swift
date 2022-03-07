//
//  HourOneDetailView.swift
//  Umbrella
//
//  Created by Alexandre Jegouic on 07/03/2022.
//

import SwiftUI

struct HourOneDetailView: View {
    let model: HourDetailsModel.Information
    
    var body: some View {
        HStack {
            Text(model.title)
            Spacer()
            Circle()
                .fill(model.indicator.color)
                .frame(width: 50, height: 50)
        }
    }
}

struct HourOneDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HourOneDetailView(
            model: HourDetailsModel.Information(
                title: "good information",
                indicator: .green
            )
        )
        
        HourOneDetailView(
            model: HourDetailsModel.Information(
                title: "bad information",
                indicator: .red
            )
        )
    }
}
