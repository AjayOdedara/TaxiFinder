# Taxinder with SwiftUI & Combine Framework

<p align="center"><img width=20% src="https://github.com/AjayOdedara/TaxiFinder/blob/main/AppIcon.png" /></p>

Create an iOS App toThe challenge consists of two parts. The first one is a list of all the vehicles near to a location; the second one is the map that renders all the vehicles.

<p align="center">
  <img width=35% src="https://github.com/AjayOdedara/TaxiFinder/blob/main/VehicleList.PNG" />
  <img width=35% src="https://github.com/AjayOdedara/TaxiFinder/blob/main/VehiclePinOnMap.PNG" />
</p>

## Table of Contents

- [About](#about)
- [Quick Start](#quick-start)
- [Features](#features)

## About

1. Loading data and displaying it in a table:

Write an app containing a list screen. The list should show all the vehicle data in the bounds of Hamburg (53.694865, 9.757589 & 53.394655, 10.099891).4. This mobile application is built using Swift 5.0 and Xcode 11.0 for iOS devices running iOS 13.0.
Fill the list items with some useful vehicle-information provided by the JSON response. You can create custom list items with selected vehicle data - simply impress us. Make the app look neat and structure the code appropriately.

2. Showing vehicles on a Map

Extend your app, so that it is able to show the vehicles on a map. Use the bounds of the map to request the vehicles. Every time the user changes the map bounds you should reload the vehicles.

If attempting to run this code on future versions of Swift/SwiftUI, Xcode, or iOS some additional work may be required to get this code running smoothly.

## Quick Start

The following steps will guide you through the process of running this application on your local machine, and device.

1. Ensure you have [Xcode 11.0](https://developer.apple.com/download/) installed
2. Checkout this repository
3. Open `TaxiFinder.xcodeproj` with Xcode
4. Go to the project settings, and change the code signing team to your own

Code signing settings are left at automatic here for simplicity, you can set these to manual if needed but these steps will not take you through that process.

6. Attach an iPhone running iOS 13.0
7. Ensure the iPhone has development mode enabled, from the Devices & Simulators window: <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>2</kbd>
8. Clean, build and run the application on an iPhone running iOS 13.0

## Features

Below is the set of user stories that outline the intended functionality of this mobile application.

### User Stories
- Available vehicle on Map based on user current location
- Showing Vehicle status and available info in List.
- End to end implementation
- Clean code & UI(SwiftUI), Architecture used MVVM with Combine
- Network Layer & Parsing
- Localizations
