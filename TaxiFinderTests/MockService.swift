//
//  MockAPI.swift
//  TaxiFinderTests
//
//  Created by Ajay Odedra on 16/11/20.
//
import Foundation
import Combine
@testable import TaxiFinder

class MockService : VehicleFetchable {
	func fetchVehicles(forBounds bounds: Coordinate) -> AnyPublisher<VehicleFetchedResponse, VehicleFetchError> {
		
		//return Publisher//self.mockData
		
		let response = HTTPURLResponse(url: URL(string: "request")!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
						//let data = "Hello, world!".data(using: .utf8)!
		return Just((data: self.mockData!, response: response))
			.setFailureType(to: URLError.self)
			.eraseToAnyPublisher()
	}
	
	let mockData: VehicleFetchedResponse?
	
	init(mockData: VehicleFetchedResponse?) {
		self.mockData = mockData
	}

//	func fetchVehicles(completion: @escaping (VehicleFetchedResponse?) -> Void) {
//		completion(mockData)
//	}
//	
}
