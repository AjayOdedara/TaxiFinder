//
//  VehicleViewModel.swift
//  MyTaxiApp
//
//  Created by Ajay Odedra on 07/11/20.
//

import SwiftUI
import Combine
import MapKit


final class VehicleViewModel: ObservableObject {
	
	@Published var coordinates = Coordinate(latitude: 53.694865, longitude: 9.757589)
	@Published var vehicleListData: [VehicleViewModel.ListItem] = []
	
	func fetchVehicles(forBounds coordinates: Coordinate) {
		
	}
}

extension VehicleViewModel{
	
	struct ListItem: Identifiable {
		
		private let item: Vehicle
		
		var id: String {
			return "\(item.id)"
		}
		var palceName: String {
			return "\(item.coordinate.latitude)" + "\n" + "\(item.coordinate.longitude)"
		}
		var location: Coordinate {
			return item.coordinate
		}
		var status: Status{
			return item.state
		}
		init(item: Vehicle) {
			self.item = item
		}
	}
	
}
