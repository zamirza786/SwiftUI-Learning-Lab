//
//  StatusText.swift
//  BarcodeScanner
//
//  Created by Zahur-Afzal Mirza on 27/03/26.
//

import SwiftUI

struct StatusText: View {
    
    let statusText: String
    let statusTextColor: Color
    
    var body: some View {
        Text(statusText)
            .bold()
            .font(.largeTitle)
            .foregroundStyle(statusTextColor)
            .padding()
    }
}
