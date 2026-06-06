//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Zahur-Afzal Mirza on 27/03/26.
//

import SwiftUI
import Combine

final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedCode: String = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannedCode.isEmpty ? "Not yet scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
}

