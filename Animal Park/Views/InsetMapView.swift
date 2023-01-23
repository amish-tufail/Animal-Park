//
//  InsetMapView.swift
//  Animal Park
//
//  Created by Amish Tufail on 23/01/2023.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)) // Center: location, span: Zoom level
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink {
                    
                } label: {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .bold()
                    }
                    .padding(.vertical, 10.0)
                    .padding(.horizontal, 14.0)
                    .background(
                        RoundedRectangle(cornerRadius: 8.0, style: .continuous)
                            .foregroundColor(.black.opacity(0.4))
                    )
                }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .padding(12.0)
            )
            .frame(height: 256.0)
            .clipShape(
                RoundedRectangle(cornerRadius: 12.0, style: .continuous)
            )
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
