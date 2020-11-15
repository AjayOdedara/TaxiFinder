//
//  Location.swift
//  TaxiFinder
//
//  Created by Ajay Odedra on 15/11/20.
//

import Foundation
import MapKit
import Contacts

extension CLPlacemark {
		/// street name, eg. Infinite Loop
		var streetName: String { thoroughfare  ?? ""}
		/// // eg. 1
		var streetNumber: String { subThoroughfare ?? "" }
		/// neighborhood, common name, eg. Mission District
		var neighborhood: String? { subLocality }
		/// e.g Tw6 9qk, 123
		var zipCode: String? { postalCode }
		/// postal address formatted
		var postalAddressFormatted: String? {
				guard let postalAddress = postalAddress else { return nil }
				return CNPostalAddressFormatter().string(from: postalAddress)
		}
}
extension CLLocation {
		func placemark(completion: @escaping (_ placemark: CLPlacemark?, _ error: Error?) -> ()) {
				CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first, $1) }
		}
}
