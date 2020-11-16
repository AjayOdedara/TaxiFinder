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
			HStack(spacing: 20){
				image
				VStack(alignment: .leading, spacing: 8){
					title
					subTitle
					note
				}
			}
		}
	}

	private var title: some View {
		Text("Status: " + item.status.rawValue)
			.frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .leading)
			.font(Font.system(size:20, design: .rounded))//font(.subheadline)
	}
	
	private var note: some View {
		Text("ID: \(item.id)")
			.frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .leading)
			.font(.footnote)
	}
	
	private var subTitle: some View {
		Text("Type: \(item.type.rawValue)")
			.frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .leading)
			.font(.footnote)
	}
	
	private var image: some View{
		Image(systemName: "car.circle.fill")
			.renderingMode(.template)
			.resizable()
			// Update background color from status of vehicle
			.foregroundColor(item.status == .active ? Color.green.opacity(0.7) : Color.pink.opacity(0.7) )
			.frame(width: 60, height: 60)
			.padding(8)
	}
}
