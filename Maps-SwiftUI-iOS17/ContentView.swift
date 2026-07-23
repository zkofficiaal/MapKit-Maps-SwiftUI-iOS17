//
//  ContentView.swift
//  Maps-SwiftUI-iOS17
//
//  Created by Z.K   on 22/07/2026.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.3346, longitude: -122.0099),
            latitudinalMeters: 1300,
            longitudinalMeters: 1300
        )
    )
    
    let locationManager = CLLocationManager()
    
    var body: some View {
        Map(initialPosition: cameraPosition) {
            Marker("Apple Visitor Centre", systemImage: "laptopcomputer", coordinate: .appleVisitorCentre)
            Marker("Panama Park", systemImage: "tree.fill", coordinate: .panamaPark)
                .tint(.green)
            
            Annotation("Apple HQ", coordinate: .appleHQ, anchor: .bottom) {
                Image(systemName: "laptopcomputer")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(.pink.gradient, in: .circle)
            }
            
            UserAnnotation()
        }
        .tint(.pink)
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
        }
        .mapControls {
            MapUserLocationButton()
            MapCompass()
            MapPitchToggle()
            MapScaleView()
            
        }
        .mapStyle(.hybrid(elevation: .realistic))
        
    }
}

#Preview {
    ContentView()
}

extension CLLocationCoordinate2D {
    static let appleHQ = CLLocationCoordinate2D(latitude: 37.3346, longitude: -122.0099)
    static let appleVisitorCentre = CLLocationCoordinate2D(latitude: 37.332753, longitude: -122.005372)
    static let panamaPark = CLLocationCoordinate2D(latitude: 37.347745, longitude: -122.018715)
}
