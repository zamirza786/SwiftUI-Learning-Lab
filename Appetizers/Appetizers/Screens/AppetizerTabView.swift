//
//  ContentView.swift
//  Appetizers
//
//  Created by Zahur-Afzal Mirza on 27/03/26.
//

import SwiftUI

// https://raw.githubusercontent.com/zamirza786/iOS-Appetizers/refs/heads/main/appetizers.json

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem { Label("House", systemImage: "house") }

            AccountView()
                .tabItem { Label("Account", systemImage: "person") }

            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
        }

    }
}

#Preview {
    AppetizerTabView()
}
