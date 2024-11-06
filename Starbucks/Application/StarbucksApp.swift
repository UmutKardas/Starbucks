//
//  StarbucksApp.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 30.10.2024.
//

import SwiftUI

@main
struct StarbucksApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainTabBarView()
            }
        }
    }
}
