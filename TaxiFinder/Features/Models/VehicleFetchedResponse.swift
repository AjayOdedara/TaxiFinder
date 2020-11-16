//
//  VehicleFetchedResponse.swift
//  MyTaxiApp
//
//  Created by Ajay Odedra on 07/11/20.
//

import Foundation

// MARK: - Vehicles
struct VehicleFetchedResponse: Codable {
	let list: [Vehicle]
	
	enum CodingKeys: String, CodingKey {
		case list = "poiList"
	}
}

// MARK: - PoiList
struct Vehicle: Codable {
	let id: Int
	let coordinate: Coordinate
	let state: Status
	let type: VehicleType
	let heading: Double
}

// MARK: - Coordinate
struct Coordinate: Codable {
	let latitude, longitude: Double
}

enum Status: String, Codable {
	case active = "ACTIVE"
	case inActive = "INACTIVE"
}

enum VehicleType: String, Codable {
	case taxi = "TAXI"
}
