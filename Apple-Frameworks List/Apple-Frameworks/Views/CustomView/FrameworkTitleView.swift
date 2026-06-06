//
//  FrameworkTitleView.swift
//  Apple-Frameworks
//
//  Created by Zahur-Afzal Mirza on 20/03/26.
//

import SwiftUI

struct FrameworkTitleView: View {

    let framework: Framework
    public var isLoadedForDetailView: Bool = false

    var body: some View {
        if isLoadedForDetailView {
            VStack {
                Image(framework.imageName)
                    .resizable()
                    .frame(width: 70, height: 70)
                Text(framework.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.5)
                    .padding()
            }
        } else {
            HStack {
                Image(framework.imageName)
                    .resizable()
                    .frame(width: 70, height: 70)
                Text(framework.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.5)
                    .padding()
            }
        }

    }
}

#Preview {
    FrameworkTitleView(
        framework: MockData.sampleFramework,
        isLoadedForDetailView: false
    )
}
