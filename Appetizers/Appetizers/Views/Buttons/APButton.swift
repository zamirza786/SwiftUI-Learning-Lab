//
//  APButton.swift
//  Appetizers
//
//  Created by Zahur-Afzal Mirza on 01/04/26.
//
import SwiftUI

struct APButton: View {

    let title: String

    var body: some View {

        Text(title)
            .font(.system(size: 18, weight: .semibold))
            .foregroundStyle(.white)
            .frame(width: 260, height: 50)
            .background(.brandPrimary, in: RoundedRectangle(cornerRadius: 10))

    }
}
#Preview {
    APButton(title: "AP Button")
}
