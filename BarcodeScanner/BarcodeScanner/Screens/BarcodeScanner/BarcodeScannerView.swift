//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Zahur-Afzal Mirza on 22/03/26.
//

import SwiftUI

struct BarcodeScannerView: View {

    @StateObject var viewModel = BarcodeScannerViewModel()

    var body: some View {
        NavigationView {
            VStack {
//                ScannerView(
//                    scannedCode: $viewModel.scannedCode,
//                    alertItem: $viewModel.alertItem
//                )
                Rectangle()
                .frame(maxHeight: 300)

                Spacer().frame(height: 60)

                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)

                StatusText(
                    statusText: viewModel.statusText,
                    statusTextColor: viewModel.statusTextColor
                )

            }
            .navigationTitle("Barcode Scanner")
            .alert(
                item: $viewModel.alertItem,
                content: { alertItem in
                    Alert(
                        title: alertItem.title,
                        message: alertItem.message,
                        dismissButton: alertItem.dismissButton
                    )
                }
            )

        }
    }
}

#Preview {
    BarcodeScannerView()
}
