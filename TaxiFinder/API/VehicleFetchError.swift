//
//  VehicleFetchError.swift
//  MyTaxiApp
//
//  Created by Ajay Odedra on 12/11/20.
//

import Foundation


enum VehicleFetchError: Error {
	case parsing(description: String)
	case network(description: String)
}
