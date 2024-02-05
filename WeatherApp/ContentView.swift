//
//  ContentView.swift
//  WeatherApp
//
//  Created by Bdjobs Mac Mini on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            
            VStack{
                
                CustomTextView(text: "Dhaka, BD", 
                               fontSize: 32)
                    .padding()
                
                VStack(spacing: 8){
                    
                    ImageView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                              width: 180,
                              height: 180)
                    
                    CustomTextView(text: "80", 
                                   fontSize: 70,
                                   isTemparature: true)
                }
                .padding(.bottom, 40)
                
                
                HStack(spacing: 20){
                    ForecastView(nameOfDay: "TUE",
                                 imageName: "cloud.sun.fill",
                                 tempareture: 73)
                    
                    ForecastView(nameOfDay: "WED",
                                 imageName: "sun.max.fill",
                                 tempareture: 75)
                    ForecastView(nameOfDay: "THU",
                                 imageName: "wind",
                                 tempareture: 70)
                    
                    ForecastView(nameOfDay: "FRI",
                                 imageName: "sun.horizon.fill",
                                 tempareture: 63)
                    
                    ForecastView(nameOfDay: "SAT",
                                 imageName: "cloud.sun.bolt.fill",
                                 tempareture: 73)
                    
                }
                
                
                Spacer()
                
                
                Button(action: {
                    isNight.toggle()
                }, label: {
                    WeatherButton(title: "Change Day Time")
                })
                
                Spacer()
                
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}



struct ForecastView: View {
    
    var nameOfDay: String
    var imageName: String
    var tempareture: Int
    
    var body: some View {
        VStack{
            CustomTextView(text: nameOfDay, fontSize: 20)
            
            ImageView(imageName: imageName, width: 40, height: 40)
            
            CustomTextView(text: String(tempareture), fontSize: 18, isTemparature: true)
        }
    }
}

struct ImageView: View {
    
    var imageName: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Image(systemName: imageName)
            .symbolRenderingMode(.multicolor)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
    }
}

struct CustomTextView: View {
    var text: String
    var fontSize: CGFloat
    var isTemparature: Bool = false
    
    var body: some View {
        Text("\(text)\(isTemparature ? "°": "")")
            .font(.system(size: fontSize, weight: .medium))
            .foregroundStyle(Color.white)
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black.opacity(0.86) : .blue,
                                                   isNight ? .black : .lightBlue]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
//        ContainerRelativeShape()
//            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
//            .ignoresSafeArea()
    }
}

struct WeatherButton: View{
    
    var title: String
    var textColor: Color = .blue
    var backgroundColor: Color = .white
    
    var body: some View{
       
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold))
            .clipShape(.rect(cornerRadius: 10, style: .circular))
    }
    
}
