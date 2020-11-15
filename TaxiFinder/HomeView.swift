//
//  ContentView.swift
//  MyTaxiApp
//
//  Created by Ajay Odedra on 07/11/20.
//

import SwiftUI
import MapKit

struct HomeView : View {
	@ObservedObject var viewModel: VehicleViewModel

	@State var manager = CLLocationManager()
	@State var alert = false

	@State var selected = 0
	@Namespace var animation
	@State var selectedTab = TabItem.map

	var edges = UIApplication.shared.windows.first?.safeAreaInsets

	var body: some View{
		// TabView...
		HStack(spacing: 0){
			ForEach(TabItem.allCases ,id: \.self){tab in
				TabBarView(tabItem: tab, selectedTab: $selectedTab,animation: animation)
				if tab != TabItem.allCases.last{
					Spacer(minLength: 0)
				}
			}
		}
		.padding(.horizontal,30)
		// for iphone like 8 and SE
		.padding(.bottom, edges?.bottom == 0 ? 15 : edges?.bottom)
		.background(Color.white)
	}
	
	
	private func list(of vehicles: [VehicleViewModel.ListItem]) -> some View {
		return List(vehicles) { vehicle in
			VehicleListItemView(item: vehicle)
		}.listStyle(PlainListStyle())
	}
}
