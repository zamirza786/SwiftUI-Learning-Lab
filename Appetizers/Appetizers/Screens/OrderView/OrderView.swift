//
//  OrderView.swift
//  Appetizers
//
//  Created by Zahur-Afzal Mirza on 29/03/26.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer  in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        
                    } label: {
                        Text("$\(order.orderPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. \nPlease add an appetizer !")
                }
            }
            .navigationTitle("🧾 Orders")
        }
        
    }
    
    
}

#Preview {
    OrderView()
}
