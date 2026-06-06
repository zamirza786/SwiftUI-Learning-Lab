//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Zahur-Afzal Mirza on 27/03/26.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
