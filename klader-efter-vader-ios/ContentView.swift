//
//
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

//struct ImageOverlay: View {
//    var body: some View {
//}

struct ContentView: View {
    
    @MainActor var weatherManager = WeatherManager()
    
    @State private var hour: String = ""
    @State private var stockholmWeather: String = ""
    @State private var gothenburgWeather: String = ""
    @State private var malmoWeather: String = ""
    
    @State private var stockholmIcon: String = ""
    @State private var gothenburgIcon: String = ""
    @State private var malmoIcon: String = ""
    @State private var kalmarIcon: String = ""
    @State private var visbyIcon: String = ""
    @State private var jonkopingIcon: String = ""
    @State private var karlstadIcon: String = ""
    @State private var gavleIcon: String = ""
    @State private var moraIcon: String = ""
    @State private var sundsvallIcon: String = ""
    @State private var ostersundIcon: String = ""
    @State private var umeaIcon: String = ""
    @State private var luleaIcon: String = ""
    @State private var tarnabyIcon: String = ""
    @State private var kirunaIcon: String = ""
    
    
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
                    Text("Vädret just nu (" + hour + ":00)")
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
                
                Image("sweden-map")
                    .overlay(
                        ZStack {
                            ZStack {
                                Image(stockholmIcon)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 30.0)
                                    .offset(x: 55.0, y: 115.0)
                                Image(gothenburgIcon)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 30.0)
                                    .offset(x: -90.0, y: 170.0)
                                Image(malmoIcon)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 30.0)
                                    .offset(x: -60.0, y: 267.0)
                                Image(kalmarIcon)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 30.0)
                                    .offset(x: 0.0, y: 225.0)
                                Image(visbyIcon)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 30.0)
                                    .offset(x: 52.0, y: 195.0)
                                Image(jonkopingIcon)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 30.0)
                                    .offset(x: -32.0, y: 170.0)
                                Image(karlstadIcon)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 30.0)
                                    .offset(x: -50.0, y: 105.0)
                                Image(gavleIcon)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 30.0)
                                    .offset(x: 30.0, y: 60.0)
                                Image(moraIcon)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 30.0)
                                    .offset(x: -20.0, y: 45.0)
                                Image(sundsvallIcon)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 30.0)
                                    .offset(x: 30.0, y: -10.0)
                            }
                            ZStack {
                                Image(ostersundIcon)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 30.0)
                                    .offset(x: -25.0, y: -50.0)
                                Image(umeaIcon)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 30.0)
                                    .offset(x: 75.0, y: -80.0)
                                Image(luleaIcon)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 30.0)
                                    .offset(x: 100.0, y: -145.0)
                                Image(tarnabyIcon)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 30.0)
                                    .offset(x: -20.0, y: -150.0)
                                Image(kirunaIcon)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 30.0)
                                    .offset(x: 55.0, y: -245.0)
                            }
                        }
                    )
                
            } // Outer VStack
            .padding([.leading, .bottom, .trailing])
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
            
            .task{
                let weathers = await weatherManager.fetchWeather()
                stockholmWeather = weatherManager.findWeather(weathers: weathers, targetCity: "Stockholm")
                gothenburgWeather = weatherManager.findWeather(weathers: weathers, targetCity: "Göteborg")
                malmoWeather = weatherManager.findWeather(weathers: weathers, targetCity: "Malmö")
                hour = String(weathers[0].hour)
                
                stockholmIcon = weatherManager.getIcon(value: weathers[0].value)
                gothenburgIcon = weatherManager.getIcon(value: weathers[1].value)
                malmoIcon = weatherManager.getIcon(value: weathers[2].value)
                kalmarIcon = weatherManager.getIcon(value: weathers[3].value)
                jonkopingIcon = weatherManager.getIcon(value: weathers[4].value)
                visbyIcon = weatherManager.getIcon(value: weathers[5].value)
                karlstadIcon = weatherManager.getIcon(value: weathers[6].value)
                gavleIcon = weatherManager.getIcon(value: weathers[7].value)
                moraIcon = weatherManager.getIcon(value: weathers[8].value)
                sundsvallIcon = weatherManager.getIcon(value: weathers[9].value)
                ostersundIcon = weatherManager.getIcon(value: weathers[10].value)
                umeaIcon = weatherManager.getIcon(value: weathers[11].value)
                luleaIcon = weatherManager.getIcon(value: weathers[12].value)
                tarnabyIcon = weatherManager.getIcon(value: weathers[13].value)
                kirunaIcon = weatherManager.getIcon(value: weathers[14].value)
                
            }
            
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
