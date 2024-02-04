//
//  ContentView.swift
//  WeatherApp
//
//  Created by Bdjobs Mac Mini on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            BackgroundView(topColor: .blue, 
                           bottomColor: Color("lightBlue"))
            
            VStack{
                
                CustomTextView(text: "Dhaka, BD", 
                               fontSize: 32)
                    .padding()
                
                VStack(spacing: 8){
                    
                    ImageView(imageName: "cloud.sun.fill", 
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
                
//                Button("Change Day Time"){
//                    print("Tapped")
//                }
//                .frame(width: 280, height: 50)
//                .background(Color.white)
//                .font(.system(size: 20, weight: .bold))
//                .clipShape(.rect(cornerRadius: 10, style: .circular))
                
                Button(action: {
                    print("Tapped")
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
            .renderingMode(.original)
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
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
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
