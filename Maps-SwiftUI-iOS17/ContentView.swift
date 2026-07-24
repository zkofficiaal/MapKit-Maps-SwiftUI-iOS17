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
    
    @State private var lookAroundScene : MKLookAroundScene?
    @State private var isShowingLookAroundScene: Bool = false
    
    var body: some View {
        Map(initialPosition: cameraPosition) {
//            Marker("Apple Visitor Centre", systemImage: "laptopcomputer", coordinate: .appleVisitorCentre)
//            Marker("Panama Park", systemImage: "tree.fill", coordinate: .panamaPark)
//                .tint(.green)
//
            
            Annotation("AppleVisitorCentre", coordinate: .appleVisitorCentre, anchor: .bottom) {
                Image(systemName: "laptopcomputer")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(.pink.gradient, in: .circle)
                    .contextMenu{
                        Button("Open Look Around", systemImage: "binoculars"){
                            Task{
                                lookAroundScene = await getLookAroundScene(from: .appleVisitorCentre)
                                guard let lookAroundScene else{
                                    return
                                }
                                isShowingLookAroundScene = true
                            }
                        }
                        Button("Get Direction", systemImage: "arrow.turn.down.right"){
                        }
                    }
                    
            }
            
            Annotation("Panama Park", coordinate: .panamaPark, anchor: .bottom) {
                Image(systemName: "tree.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(.pink.gradient, in: .circle)
                    .contextMenu{
                        Button("Open Look Around", systemImage: "binoculars"){
                            Task{
                                lookAroundScene = await getLookAroundScene(from: .panamaPark)
                                guard let lookAroundScene else{
                                    return
                                }
                                isShowingLookAroundScene = true
                            }
                        }
                        Button("Get Direction", systemImage: "arrow.turn.down.right"){
                        }
                    }
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
        .lookAroundViewer(isPresented: $isShowingLookAroundScene, scene: $lookAroundScene)
    }
    
    func getLookAroundScene (from coordinate : CLLocationCoordinate2D) async -> MKLookAroundScene? {
        do {
            return try await MKLookAroundSceneRequest(coordinate: coordinate).scene
        }
        catch{
            print("cannot retrive look areoun scene \(error.localizedDescription)")
            return nil
        }
    }
    
    func getUserLocation() async -> CLLocationCoordinate2D? {
        let updates = CLLocationUpdate.liveUpdates()
        
        do {
            let update = try await updates.first{
                $0.location?.coordinate != nil
            }
            return update?.location?.coordinate
        }
        catch {
            print("can not get user location")
            return nil
        }
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
