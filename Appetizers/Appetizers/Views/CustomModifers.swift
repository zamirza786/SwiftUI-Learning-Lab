//
//  CustomModifers.swift
//  Appetizers
//
//  Created by Zahur-Afzal Mirza on 02/04/26.
//

import SwiftUI


struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.accentColor)
            .controlSize(.large)
    }
}


extension Image {
    func listCellImageStyle() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .frame(width: 120, height: 90)
    }
}


extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
