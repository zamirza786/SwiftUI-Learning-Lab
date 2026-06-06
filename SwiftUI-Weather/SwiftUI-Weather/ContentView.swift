//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Zahur-Afzal Mirza on 25/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA ")
                
                MainWeatherStatusView(
                    imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temperature: 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.sun.fill",
                        temperature: 74)
                    
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "sun.max.fill",
                        temperature: 88)
                    
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: "wind.snow",
                        temperature: 55)
                    
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "sunset.fill",
                        temperature: 60)
                    
                    WeatherDayView(
                        dayOfWeek: "SAT",
                        imageName: "snowflake",
                        temperature: 25)
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .white,
                                  backgroundColor: .mint)
                }
                
                Spacer()
            }
        }
//        .onAppear {
//            let button = WeatherButton(
//                title: "Change Day Timie",
//                textColor: .blue,
//                backgroundColor: .white)
//            
//            print(type(of: button.body))
//            
//            
//        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 4) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.hierarchical)
                .resizable()
                //.foregroundStyle(.pink , .orange, .green)
                .foregroundStyle(.pink)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        
        /// can be declated here but require a default value
        //let topColor: Color
        //let bottomColor: Color
        
//        LinearGradient(
//            gradient: .init(colors: [
//                isNight ? .black: .blue,
//                isNight ? .gray : .lightBlue]),
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing)
//        .edgesIgnoringSafeArea(.all)
        
        ContainerRelativeShape() 
            .fill(isNight ? Color.black.gradient :  Color.blue.gradient).ignoresSafeArea()
    }
}


struct CityTextView: View {
    
    let cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    let imageName: String
    let temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original )
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }.padding(.bottom, 40)
    }
}

