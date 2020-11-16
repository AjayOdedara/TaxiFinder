//
//  VehicleTests.swift
//  TaxiFinderTests
//
//  Created by Ajay Odedra on 16/11/20.
//

import Foundation

import XCTest
@testable import TaxiFinder

class VehicleTest: XCTestCase {
	func testSuccessParser() {
		let json = """
	{
	"poiList": [
	{
	"id": -479925044,
	"coordinate": {
	"latitude": 53.5530854,
	"longitude": 9.955689
	},
	"state": "INACTIVE", "type": "TAXI", "heading": 0.0
	}
	]
	}
	""".data(using: .utf8)!
		
		let vehicles = try! JSONDecoder().decode(VehicleFetchedResponse.self, from: json)
		XCTAssertNotNil(vehicles)
	}
}
