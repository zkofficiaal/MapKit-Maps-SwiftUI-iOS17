//
//  ContentView.swift
//  Maps-SwiftUI-iOS17
//
//  Created by Z.K   on 22/07/2026.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let cameraPosition : MapCameraPosition = .region(.init(center: .init(latitude: 37.3346, longitude: -122.0099), latitudinalMeters: 13000, longitudinalMeters: 13000))
    var body: some View {
        Map(initialPosition: cameraPosition){
            Marker("Apple visitor centre",systemImage: "laptopcomputer", coordinate: .appleVisitorCentre)
        }
    }
}

#Preview {
    ContentView()
}

extension CLLocationCoordinate2D {
    static let applleHQ = CLLocationCoordinate2D(latitude: 37.3346, longitude: -122.0099)
    static let appleVisitorCentre = CLLocationCoordinate2D(latitude: 37.332753, longitude: -122.005372)
}
