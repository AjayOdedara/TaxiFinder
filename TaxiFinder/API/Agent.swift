//
//  Agent.swift
//  MyTaxiApp
//
//  Created by Ajay Odedra on 07/11/20.
//

import Foundation
import Combine

struct Agent {
	func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, VehicleFetchError> {
		return URLSession.shared
			.dataTaskPublisher(for: request)
			.map { $0.data }
			.handleEvents(receiveOutput: { print("Response Data",
																					 NSString(data: $0, encoding: String.Encoding.utf8.rawValue)!) })
			.decode(type: T.self, decoder: JSONDecoder())
			.receive(on: DispatchQueue.main)
			.mapError { error in
				.network(description: error.localizedDescription)
			}
			.eraseToAnyPublisher()
	}
}
