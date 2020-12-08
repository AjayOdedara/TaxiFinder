//
//  MapView.swift
//  TaxiFinder
//
//  Created by Ajay Odedra on 08/11/20.
//

import SwiftUI
import MapKit


struct MapView : UIViewRepresentable {
	
	var vehicles: [VehicleViewModel.ListItem]
	@Binding var manager: CLLocationManager
	@Binding var alert: Bool
	@Binding var coordinates: Coordinate
	
	let map = MKMapView()
	
	func makeCoordinator() -> MapView.Coordinator {
		return Coordinator(parent: self)
	}
	
	func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
		let center = CLLocationCoordinate2D(latitude: 53.694865,longitude: 9.757589)
		let region = MKCoordinateRegion(center: center, latitudinalMeters: 2000, longitudinalMeters: 2000)
		map.region = region
		map.showsUserLocation = true
		
		manager.requestWhenInUseAuthorization()
		manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
		manager.distanceFilter = 10
		manager.pausesLocationUpdatesAutomatically = true
		manager.activityType = .automotiveNavigation
		manager.allowsBackgroundLocationUpdates = true
		map.delegate = context.coordinator
		manager.delegate = context.coordinator
		
		manager.startUpdatingLocation()
		
		return map
	}
	func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
		print("I am being called!")
		
		for item in vehicles{
			
			let point = MKPointAnnotation()
			let location = CLLocation(latitude: item.location.latitude, longitude: item.location.longitude)
			point.subtitle = item.status.rawValue
			point.coordinate = location.coordinate
			uiView.addAnnotation(point)
		}
	}
	
	class Coordinator : NSObject, CLLocationManagerDelegate, MKMapViewDelegate{
		
		var parent : MapView
		
		init(parent : MapView) {
			self.parent = parent
		}
		
		func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
			if status == .denied{
				parent.alert.toggle()
			}
		}
		
		func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
			
			for location in locations {
				let recent = location.timestamp.timeIntervalSinceNow
				guard location.horizontalAccuracy < 20 && abs(recent) < 10 else { continue }
				parent.coordinates = Coordinate(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
				let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
				self.parent.map.region = region
			}
		}
	}
}
