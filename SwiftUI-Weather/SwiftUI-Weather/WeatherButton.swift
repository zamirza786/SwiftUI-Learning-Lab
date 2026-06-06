//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Zahur-Afzal Mirza on 27/07/25.
//

import SwiftUI

struct WeatherButton: View {
    
    let title: String
    let textColor, backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10) 
    }
}/System/Library/CoreServices/Finder.app/Contents/Resources/MyLibraries/SharedDocuments.cannedSearch

struct WweatherButton_Preview: PreviewProvider
{
    static var previews: some View
    {
        WeatherButton(title: "Test Title",
                      textColor: .white,
                      backgroundColor: .blue)
    }
}


