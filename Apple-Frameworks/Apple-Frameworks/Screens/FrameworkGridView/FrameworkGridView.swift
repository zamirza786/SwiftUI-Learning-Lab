//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Zahur-Afzal Mirza on 18/02/26.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        NavigationLink(value: framework, label: {
                            FrameworkTitleView(framework: framework)
                        })
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .navigationDestination(for: Framework.self, destination: { framework in
                FrameworkDetailView(framework: framework)
            })
        }
    }
}


#Preview {
    FrameworkGridView()
}

