//
//  VehicleListItemView.swift
//  MyTaxiApp
//
//  Created by Ajay Odedra on 14/11/20.
//

import SwiftUI

struct VehicleListItemView: View {
	let item: VehicleViewModel.ListItem
	
	var body: some View {
		VStack(alignment: .leading, spacing: 0){
			HStack(spacing: 0){
				image
				title
			}.cornerRadius(8)
		}
	}
	
	private var title: some View {
		Text("\(item.id)")
			.frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
	}
	
	private var image: some View{
		Image(systemName: "car.circle.fill")
			.renderingMode(.template)
			.resizable()
			.foregroundColor(item.status == .active ? Color.green.opacity(0.7) : Color.pink.opacity(0.7) )
			.frame(width: 60, height: 60)
			.padding(8)
	}
}
