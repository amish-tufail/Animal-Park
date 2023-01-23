//
//  CompassView.swift
//  Animal Park
//
//  Created by Amish Tufail on 23/01/2023.
//

import SwiftUI
import MapKit

struct CompassView: View {
    var name: String
    var region: CLLocationDegrees
    var body: some View {
        HStack {
            Text(name)
                .font(.footnote)
                .bold()
                .foregroundColor(.accentColor)
            Spacer()
            Text("\(region)")
                .font(.footnote)
                .foregroundColor(.white)
        }
    }
}

struct CompassView_Previews: PreviewProvider {
    static var locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    static var previews: some View {
        CompassView(name: "Latitude", region: locations[0].latitude)
    }
}
