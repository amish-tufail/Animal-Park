//
//  MapView.swift
//  Animal Park
//
//  Created by Amish Tufail on 23/01/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion = { // This is where the map will be at
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }() // Here we break up into multiple parts but in InsetMapView we don't break it up
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json") // This is only for annotations
    var body: some View {
        // Basic Map
//        Map(coordinateRegion: $region)
        // Advanced Map
        GeometryReader { proxy in
            Map(coordinateRegion: $region, annotationItems: locations) { item in
                // Static Annotation Methods
    //            MapPin(coordinate: item.location, tint: .accentColor) // Method 1
    //            MapMarker(coordinate: item.location) // Method 2
                // Custom Annotation Methods
                MapAnnotation(coordinate: item.location) {
                    MapAnnotationView(location: item)
                }
            }
            .overlay(
                HStack(alignment: .center, spacing: 12.0) {
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48.0, height: 48.0, alignment: .center)
                    VStack(alignment: .leading, spacing: 3.0) {
                        CompassView(name: "Latitude:", region: region.center.latitude)
                        CompassView(name: "Longtiude", region: region.center.longitude)
                    }
                }
                    .padding(.vertical, 12.0)
                    .padding(.horizontal, 16.0)
                    .background(
                        RoundedRectangle(cornerRadius: 8.0, style: .continuous)
                            .fill(.black.opacity(0.6))
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding()
                    .padding(.top, proxy.safeAreaInsets.top)
            )
        .ignoresSafeArea()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
