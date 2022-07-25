//
//  ContentView.swift
//  klader-efter-vader-ios
//
//  Created by Christoffer on 2022-07-12.
//

import SwiftUI

var host = "http://localhost:3000/"

struct City: Codable {
    var id: Int
    var latitude, longitude: Double
    var name: String
}

struct Cities: Codable {
    var cities: [City]
}

struct ContentView: View {
    
    @MainActor var weatherManager = WeatherManager()
    
    @State private var stockholmWeather: String = ""
    @State private var gothenburgWeather: String = ""
    @State private var malmoWeather: String = ""
//
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 10.0) {
                VStack(alignment: .center){
                    Text("Kläder Efter Väder")
                }
                .padding()
                .frame(width: 390.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.788, green: 0.949, blue: 1.0)/*@END_MENU_TOKEN@*/)

                VStack(alignment: .center){
                    Text("Välkommen till Kläder Efter Väder!")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    Text("Kläder efter väder finns här för att hjälpa dig med det svåra i vardagen, att välja kläder! Kanske ser det ut att vara strålande sol just nu men ska bli molnigt och blåsigt ikväll. Kanske är det molnigt nu men ska spöregna om några t viimmar. Hur det än blir så hjälper vi dig med klädvalet!")
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)

                }
                .padding(.horizontal)

                VStack(alignment: .leading){
                    Text("Vilken stad bor du i?")
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    TextField("Välj stad", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .padding()
                        .border(.gray)
                }
                .padding(.horizontal)

                VStack(alignment: .center){
                    Button() {
                    } label: {
                        Text("Se vilka kläder du ska ta på dig idag!")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.788, green: 0.949, blue: 1.0)/*@END_MENU_TOKEN@*/)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                            .cornerRadius(40)
                    }

                    Button() {
                    } label: {
                        Text("Ta reda på om du behöver ta pollenmedicin idag!")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.788, green: 0.949, blue: 1.0)/*@END_MENU_TOKEN@*/)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                            .cornerRadius(40)
                    }

                    Button() {
                    }label:{
                        Text("Ta reda på hur stark solkyddsfaktor du behöver ta idag!")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.788, green: 0.949, blue: 1.0)/*@END_MENU_TOKEN@*/)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                            .cornerRadius(40)
                    }
                }
                .padding(.all)

                VStack(alignment: .leading){
                    Text("Vädret just nu ")
                        .fontWeight(.semibold)
                        .padding(.bottom)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                    Text("Stockholm")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    Text(stockholmWeather)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    Text("Göteborg ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    Text(gothenburgWeather)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    Text("Malmö ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    Text(malmoWeather)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal)
                .task{
                    Task{
                        let weathers = await weatherManager.fetchWeather()
//                                await fetchWeather()
                        stockholmWeather = weatherManager.findWeather(weathers: weathers, targetCity: "Stockholm")
                        gothenburgWeather = weatherManager.findWeather(weathers: weathers, targetCity: "Göteborg")
                        malmoWeather = weatherManager.findWeather(weathers: weathers, targetCity: "Malmö")
//                        print(weathers)
                    }
                }
                

                Image("sweden-map")


            } // Outer VStack
            .padding([.leading, .bottom, .trailing])
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)

        } // ScrollView
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.788, green: 0.949, blue: 1.0)/*@END_MENU_TOKEN@*/)
    }
}
        
        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
