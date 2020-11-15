//
//  Shape.swift
//  MyTaxiApp
//
//  Created by Ajay Odedra on 15/11/20.
//

import SwiftUI

struct CustomShape: Shape {
		func path(in rect: CGRect) -> Path {
				let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 10, height: 10))
				return Path(path.cgPath)
		}
}
