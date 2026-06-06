//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Zahur-Afzal Mirza on 01/04/26.
//

import SwiftUI

struct AppetizerDetailView: View {

    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool

    var body: some View {
        VStack {
            
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 225)

            VStack {

                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)

                Text(appetizer.description)
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()

                HStack(spacing: 40) {

                    AppetizerInformationView(
                        title: "Calories",
                        value: "\(appetizer.calories)"
                    )

                    AppetizerInformationView(
                        title: "Carbs",
                        value: "\(appetizer.carbs) g"
                    )

                    AppetizerInformationView(
                        title: "Protein",
                        value: "\(appetizer.protein) g"
                    )

                }
            }

            Spacer()

            // Note - always create button here and inject view
            Button {
                order.add(appetizer)
                isShowingDetail = false
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add To Order")
            }
            .modifier(StandardButtonStyle())
            .padding(.bottom, 30)
            
            

        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 40)
        .overlay(
            Button {
                isShowingDetail = false
            } label: {
                APXDismissButton()
            }, alignment: .topTrailing
        )
    }
}



struct AppetizerInformationView: View {

    let title: String
    let value: String

    var body: some View {

        VStack(spacing: 5) {

            Text(title)
                .font(.caption)
                .fontWeight(.bold)

            Text(value)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()

        }
    }
}

#Preview {
    AppetizerDetailView(
        appetizer: MockData.sampleAppetizer,
        isShowingDetail: .constant(true))
}
