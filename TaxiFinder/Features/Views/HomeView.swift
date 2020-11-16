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
	
	var mapView: some View{
		MapView(vehicles: viewModel.vehicleListData, manager: $manager, alert: $alert, coordinates: $viewModel.coordinates).alert(isPresented : $alert){
			// If user denied at first time
			Alert(title: Text("Please enable location access in settings!"))
		}
	}
	var vehiclesListView: some View{
		NavigationView {
			switch viewModel.state{
			case .idle:
				Color.clear.eraseToAnyView()
			case .loading:
				Spinner(isAnimating: true, style: .large).eraseToAnyView()
			case .loaded(let vehicles):
				if vehicles.count > 0{
					list(of: vehicles)
					.navigationBarTitle(TabItem.vehicles.rawValue)
				}else{
					Text("No vehiles in region or error")
				}
			case .error (let error):
				VStack(alignment: .center) {
					Text(error.localizedDescription)
				}
			}
		}
	}
	var body: some View{
		
		VStack(spacing: 0){
			GeometryReader{_ in
				ZStack{
					// Tabs....
					mapView
						.opacity(selectedTab == TabItem.map ? 1 : 0)
					vehiclesListView
						.opacity(selectedTab == TabItem.vehicles ? 1 : 0)
				}
			}
			// TabView...
			tabView
		}
		.ignoresSafeArea(.all, edges: .bottom)
		.background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
	}
	
	var tabView: some View{
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
