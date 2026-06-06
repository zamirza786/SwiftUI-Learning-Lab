//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Zahur-Afzal Mirza on 20/02/26.
//

import SwiftUI

struct FrameworkDetailView: View {

    let framework: Framework
    @State private var isShowingSafariView = false

    var body: some View {
    
        VStack {
                        
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        })
        
    }
}

#Preview {
    FrameworkDetailView(
        framework: MockData.sampleFramework
    )
}
