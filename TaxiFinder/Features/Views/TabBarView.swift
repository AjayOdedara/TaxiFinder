//
//  TabBarView.swift
//  MyTaxiApp
//
//  Created by Ajay Odedra on 11/11/20.
//

import SwiftUI


struct TabBarView : View {
	
	var tabItem : TabItem
	@Binding var selectedTab : TabItem
	var animation : Namespace.ID
	
	var body: some View{
		
		Button(action: {
			withAnimation{selectedTab = tabItem}
		}) {
			VStack(spacing: 3){
				// Top Indicator, Custom Shape... Slide in and out animation...
				ZStack{
					CustomShape()
						.fill(Color.clear)
						.frame(width: 100, height: 6)
					
					if selectedTab == tabItem{
						CustomShape()
							.fill(Color.green.opacity(0.9))
							.frame(width: 100, height: 6)
							.matchedGeometryEffect(id: "Tab_Change", in: animation)
					}
				}
				.padding(.bottom, 5)
				// image & title
				imageView
				titleView
			}
		}
	}
	var titleView: some View{
		Text(tabItem.rawValue)
			.font(.caption)
			.fontWeight(.bold)
			.foregroundColor(Color.black.opacity(selectedTab == tabItem ? 0.6 : 0.2))
	}
	var imageView: some View{
		Image(tabItem.rawValue.lowercased())
			.renderingMode(.template)
			.resizable()
			.foregroundColor(selectedTab == tabItem ? Color.green.opacity(0.8) : Color.black.opacity(0.2))
			.frame(width: 24, height: 24)
	}
}
