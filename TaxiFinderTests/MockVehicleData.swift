//
//  MockVehicleData.swift
//  TaxiFinderTests
//
//  Created by Ajay Odedra on 16/11/20.
//

import Foundation
@testable import TaxiFinder

extension VehicleFetchedResponse {	
	static func with(
		list: [Vehicle] = [Vehicle(id: -479925044,
															 coordinate: Coordinate(latitude: 53.694865, longitude: 9.757589),
															 state:  .active,
															 type:  .taxi,
															 heading:  11.0 )]) -> VehicleFetchedResponse {
		return VehicleFetchedResponse(
			list: list)
	}
}
