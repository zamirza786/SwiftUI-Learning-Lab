//
//  AFButton.swift
//  Apple-Frameworks
//
//  Created by Zahur-Afzal Mirza on 20/02/26.
//

import SwiftUI

struct AFButton: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(Color.red, in: RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(.white)
    }
}

#Preview {
    AFButton(title: "Learn More")
}
