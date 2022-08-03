//
//  Components.swift
//  klader-efter-vader-ios
//
//  Created by Christoffer on 2022-08-03.
//

import Foundation
import SwiftUI

struct WeatherIcon: View {
    let icon: String
    let x, y: Double
    
    var body: some View {
        Image(icon)
            .resizable(resizingMode: .stretch)
            .frame(width: 40.0, height: 30.0)
            .offset(x: x, y: y)
    }
}

struct InfoButton: View {
    let label: String
    let isShown: Bool
    let action: () -> Void
    
    
    var body: some View {
        if isShown {
            Button(label, action: {action()})
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(red: 0.788, green: 0.949, blue: 1.0))
            .foregroundColor(.black)
            .cornerRadius(40)
        }
    }
}

struct OptionButton: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(label,
               action: {action()})
        .frame(maxWidth: .infinity)
        .padding()
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.788, green: 0.949, blue: 1.0)/*@END_MENU_TOKEN@*/)
        .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
        .cornerRadius(10)
    }
}

struct InfoStack: View {
    let text: String
    let isShown: Bool
    let update: () -> Void
    let cancel: () -> Void
    
    
    var body: some View {
        if isShown {
            HStack(alignment: .center) {
                Text(text)
                    .multilineTextAlignment(.leading)
                    .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity)
                    .frame(maxWidth: .infinity)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.788, green: 0.949, blue: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                VStack(alignment: .center) {
                    Button("Uppdatera", action: {update()})
                        .padding(/*@START_MENU_TOKEN@*/.all, 5.0/*@END_MENU_TOKEN@*/)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.788, green: 0.949, blue: 1.0)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(5)
                    Button("Återgå", action: {cancel()})
                        .padding(/*@START_MENU_TOKEN@*/.all, 5.0/*@END_MENU_TOKEN@*/)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.gray/*@END_MENU_TOKEN@*/)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .padding(.bottom, 2.0)
        }
    }
}

struct CityTitle: View {
    let text: String
    
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title3)
            .multilineTextAlignment(.leading)
    }
}

struct CityWeather: View {
    let text: String
    
    var body: some View {
        Text(text)
            .padding(.bottom)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
    }
}
