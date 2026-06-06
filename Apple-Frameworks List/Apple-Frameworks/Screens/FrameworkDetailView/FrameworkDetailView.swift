//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Zahur-Afzal Mirza on 20/02/26.
//

import SwiftUI

struct FrameworkDetailView: View {

    @ObservedObject var viewModel: FrameworkDetailViewModel

    var body: some View {

        VStack {

            XDismissButton(
                isShowingDetailView: $viewModel.isShowingDetailView.wrappedValue
            )

            Spacer()

            FrameworkTitleView(
                framework: viewModel.framework,
                isLoadedForDetailView: true
            )

            Text(viewModel.framework.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()

            Spacer()

            Button {
                viewModel.isShowingSafariView = true
            } label: {
                //AFButton(title: "Learn More")
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .foregroundStyle(Color(.yellow))
            .buttonBorderShape(.roundedRectangle(radius: 20))
            .tint(.red)
        }
        .fullScreenCover(
            isPresented: $viewModel.isShowingSafariView,
            content: {
                SafariView(
                    url: URL(string: viewModel.framework.urlString) ?? URL(
                        string: "www.apple.com"
                    )!
                )
            }
        )

    }
}

#Preview {
    FrameworkDetailView(
        viewModel: .init(
            framework: MockData.sampleFramework,
            isShowingDetailView: .constant(false)
        )
    )
}
