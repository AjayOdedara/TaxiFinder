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
	@Published var state = State.idle
	
	private let vehiclesFetchService: VehiclesFetchService
	private var disposables = Set<AnyCancellable>()
	
	init(
		vehiclesFetchService: VehiclesFetchService,
		scheduler: DispatchQueue = DispatchQueue(label: "VehiclesFetchService")
	) {
		self.vehiclesFetchService = vehiclesFetchService
		$coordinates
			.debounce(for: .seconds(0.5), scheduler: scheduler)
			.sink(receiveValue: fetchVehicles(forBounds:))
			.store(in: &disposables)
	}
	
	func fetchVehicles(forBounds coordinates: Coordinate) {
		DispatchQueue.main.async{
			self.state = .loading
		}
		
		vehiclesFetchService.fetchVehicles(forBounds: coordinates)
			.map { response in
				response.list.map(VehicleViewModel.ListItem.init)
			}
			.receive(on: DispatchQueue.main)
			.sink(
				receiveCompletion: { [weak self] value in
					guard let self = self else { return }
					switch value {
					case .failure(let error):
						let error = VehicleFetchError.network(description: error.localizedDescription.description)
						self.state = .error(error)
						self.vehicleListData = []
					case .finished:
						break
					}
				},
				receiveValue: { [weak self] data in
					guard let self = self else { return }
					self.vehicleListData = data
					self.state = .loaded(data)
				})
			.store(in: &disposables)
	}
}

extension VehicleViewModel{
	enum State {
			case idle
			case loading
			case loaded([VehicleViewModel.ListItem])
			case error(VehicleFetchError)
	}
	
	struct ListItem: Identifiable {
		
		private let item: Vehicle
		
		var id: String {
			return "\(item.id)"
		}
		var location: Coordinate {
			return item.coordinate
		}
		var status: Status{
			return item.state
		}
		var type: VehicleType{
			return item.type
		}
		init(item: Vehicle) {
			self.item = item
		}
	}
	
}
