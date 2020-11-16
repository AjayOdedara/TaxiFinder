//
//  VehicleViewModelTests.swift
//  TaxiFinderTests
//
//  Created by Ajay Odedra on 16/11/20.
//

import XCTest
@testable import TaxiFinder

class VehicleViewModelTests: XCTestCase {
	
	let location = Coordinate(latitude: 53.694865, longitude: 9.757589)
	
	func testSuccessFetchData() {
		let expectedList = VehicleFetchedResponse.with()
		let service = MockService(mockData: expectedList)
		
		let viewModel = VehicleViewModel(vehiclesFetchService: service)
		
		viewModel.fetchVehicles(forBounds: location)
		switch viewModel.state {
		case .loaded(let data):
			XCTAssertEqual(data.count, 1)
		default:
			XCTFail()
		}
	}
	
	func testEmptyData() {
		
		let expectedList = VehicleFetchedResponse(list: [])
		let service = MockService(mockData: expectedList)
		
		let viewModel = VehicleViewModel(vehiclesFetchService: service)
		viewModel.fetchVehicles(forBounds: location)
		XCTAssertEqual(viewModel.vehicleListData.count, 0)
	 }
	 
	 func testNilData() {
		let expectedList: VehicleFetchedResponse? = nil
		let service = MockService(mockData: expectedList)
		
		let viewModel = VehicleViewModel(vehiclesFetchService: service)
		viewModel.fetchVehicles(forBounds: location)
		XCTAssertEqual(viewModel.vehicleListData.count, 0)
	 }

}
