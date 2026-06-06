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
        NavigationView {
            List {
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(
                        destination: FrameworkDetailView(
                            viewModel: FrameworkDetailViewModel(
                                framework: framework,
                                isShowingDetailView: $viewModel
                                    .isShowingDetailView
                            )
                        )
                    ) {
                        FrameworkTitleView(framework: framework)
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
        }
        //.accentColor(Color(.label)) /// applicable when we have a title
    }
}

#Preview {
    FrameworkGridView()
}
