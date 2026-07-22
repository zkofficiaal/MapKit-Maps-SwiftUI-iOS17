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
        Map(initialPosition: cameraPosition){
//            Marker("Apple visitor centre",systemImage: "laptopcomputer", coordinate: .appleVisitorCentre)
//            Marker("panamaPark", systemImage: "tree.fil", coordinate: .panamaPark)
//                .tint(.green)
            
            Annotation("AppleHQ", coordinate: .applleHQ, anchor: .bottom){
                Image(systemName: "laptopcomputer")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(.pink.gradient,in: .circle)
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}

extension CLLocationCoordinate2D {
    static let applleHQ = CLLocationCoordinate2D(latitude: 37.3346, longitude: -122.0099)
    static let appleVisitorCentre = CLLocationCoordinate2D(latitude: 37.332753, longitude: -122.005372)
    static let panamaPark = CLLocationCoordinate2D(latitude: 37.347745, longitude: -122.018715)
}
