//
//  ContentView.swift
//  Maps-SwiftUI-iOS17
//
//  Created by Z.K   on 22/07/2026.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let cameraPosition : MapCameraPosition = .region(.init(center: .init(latitude: 37.3346, longitude: -122.0099), latitudinalMeters: 1300, longitudinalMeters: 1300))
    var body: some View {
        Map(initialPosition: cameraPosition)
    }
}

#Preview {
    ContentView()
}
