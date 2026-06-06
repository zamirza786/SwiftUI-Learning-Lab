//
//  XDismissButtono.swift
//  Appetizers
//
//  Created by Zahur-Afzal Mirza on 01/04/26.
//

import SwiftUI

struct APXDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .opacity(0.6)

            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    APXDismissButton()
}
