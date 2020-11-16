//
//  VehiclesFetchService.swift
//  MyTaxiApp
//
//  Created by Ajay Odedra on 07/11/20.
//

import Foundation
import Combine

// Protocol
protocol VehicleFetchable {
	func fetchVehicles(
		forBounds bounds: Coordinate
	) -> AnyPublisher<VehicleFetchedResponse, VehicleFetchError>
}

class VehiclesFetchService {
	private let agent: Agent
	
	init(agent: Agent = Agent()) {
		self.agent = agent
	}
}


// MARK: - VehicleFetchable
extension VehiclesFetchService: VehicleFetchable {
	func fetchVehicles(forBounds bounds: Coordinate) -> AnyPublisher<VehicleFetchedResponse, VehicleFetchError> {
		return fetch(with: makeVehicleRequestComponents(forBounds: bounds))
	}
	
	private func fetch<T>(
		with components: URLComponents
	) -> AnyPublisher<T, VehicleFetchError> where T: Decodable {
	
		guard let url = components.url else {
			let error = VehicleFetchError.network(description: "Couldn't create URL")
			return Fail(error: error).eraseToAnyPublisher()
		}
		return agent.run(URLRequest(url: url))
	}
}


// MARK: - Vehicle API
private extension VehiclesFetchService {
	struct VehicleAPI {
		static let scheme = "https"
		static let host = "poi-api.mytaxi.com"
		static let path = "/PoiService/poi/v1"
	}
	
	func makeVehicleRequestComponents(
		forBounds bounds: Coordinate
	) -> URLComponents {
		var components = URLComponents()
		components.scheme = VehicleAPI.scheme
		components.host = VehicleAPI.host
		components.path = VehicleAPI.path
		
		components.queryItems = [
			URLQueryItem(name: "p2Lat", value: "\(bounds.latitude)"),
			URLQueryItem(name: "p1Lon", value: "\(bounds.longitude)"),
			URLQueryItem(name: "p1Lat", value: "\(bounds.latitude + 0.1)"),
			URLQueryItem(name: "p2Lon", value: "\(bounds.longitude + 0.1)"),
		]
		
		return components
	}
	
}
