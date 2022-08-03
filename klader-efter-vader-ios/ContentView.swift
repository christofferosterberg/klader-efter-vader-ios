//
//
//  klader-efter-vader-ios
//
//  Created by Christoffer on 2022-07-12.
//

import SwiftUI
import MapKit

var host = "https://klader-efter-vader.herokuapp.com/"

struct ContentView: View {
    
    @ObservedObject private var locationManager = LocationManager()
    
    @State private var city: String = ""
    @State private var cities: [City] = []
    @State private var clothes: String = ""
    @State private var clothesButtonIsShown: Bool = true
    @State private var clothesStackIsShown: Bool = false
    @State private var pollen: String = ""
    @State private var allergyValue: Int = 0
    @State private var pollenButtonIsShown: Bool = true
    @State private var pollenQuestionsAreShown: Bool = false
    @State private var pollenStackIsShown: Bool = false
    @State private var uv: String = ""
    @State private var uvValue: Int = 0
    @State private var uvButtonIsShown: Bool = true
    @State private var uvQuestionsAreShown: Bool = false
    @State private var uvStackIsShown: Bool = false
    
    @MainActor var cityManager = CityManager()
    @MainActor var weatherManager = WeatherManager()
    @MainActor var clothesManager = ClothesManager()
    @MainActor var pollenManager = PollenManager()
    @MainActor var uvManager = UVManager()
    
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
    
    
    var body: some View {
        let coordinate = self.locationManager.location != nil
        ? self.locationManager.location!.coordinate : CLLocationCoordinate2D()
        
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
                    TextField("Välj stad", text: $city)
                        .padding()
                        .border(.gray)
                }
                .padding(.horizontal)
                .task {
                    cities = await cityManager.fetchCities()
                    if coordinate.latitude != 0.0 && coordinate.longitude != 0.0 {
                        city = cityManager.findClosestCity(latitude: coordinate.latitude, longitude: coordinate.longitude, cities: cities)
                        
                    }
                }
                
                VStack(alignment: .center){
                    
                    // CLOTHES //
                    InfoButton(label: "Se vilka kläder du ska ta på dig idag!", isShown: clothesButtonIsShown,
                               action: {
                        Task {
                            clothesButtonIsShown = false
                            clothesStackIsShown = true
                            clothes = await clothesManager.fetchClothes(city: city)
                        }
                    })
                    
                    InfoStack(text: clothes, isShown: clothesStackIsShown,
                              update: {
                        Task {
                            clothes = await clothesManager.fetchClothes(city: city)
                        }
                    },cancel: {
                        Task {
                            clothesButtonIsShown = true
                            clothesStackIsShown = false
                        }
                    })
                    
                    // POLLEN //
                    InfoButton(label: "Ta reda på om du behöver ta pollenmedicin idag!", isShown: pollenButtonIsShown,
                               action: {
                        Task {
                            pollenButtonIsShown = false
                            pollenQuestionsAreShown = true
                        }
                    })
                    
                    if pollenQuestionsAreShown {
                        Text("Hur allergisk skulle du säga att du är emot pollen?")
                            .font(.title3)
                            .multilineTextAlignment(.leading)
                        HStack{
                            OptionButton(label: "Lite allergisk", action: {
                                Task {
                                    pollenQuestionsAreShown = false
                                    pollenStackIsShown = true
                                    allergyValue = 0
                                    pollen = await pollenManager.fetchPollen(city: city, allergy: allergyValue)
                                }
                            })
                            OptionButton(label: "Ganska allergisk", action: {
                                Task {
                                    pollenQuestionsAreShown = false
                                    pollenStackIsShown = true
                                    allergyValue = 1
                                    pollen = await pollenManager.fetchPollen(city: city, allergy: allergyValue)
                                }
                            })
                            OptionButton(label: "Väldigt allergisk", action: {
                                Task {
                                    pollenQuestionsAreShown = false
                                    pollenStackIsShown = true
                                    allergyValue = 2
                                    pollen = await pollenManager.fetchPollen(city: city, allergy: allergyValue)
                                }
                            })
                        }
                    }
                    
                    InfoStack(text: pollen, isShown: pollenStackIsShown,
                              update: {
                        Task {
                            pollen = await pollenManager.fetchPollen(city: city, allergy: allergyValue)
                        }
                    }, cancel: {
                        Task {
                            pollenButtonIsShown = true
                            pollenStackIsShown = false
                        }
                    })
                    
                    // UV //
                    InfoButton(label: "Ta reda på hur stark solkyddsfaktor du behöver ta idag!", isShown: uvButtonIsShown, action: {
                        Task {
                            uvButtonIsShown = false
                            uvQuestionsAreShown = true
                        }
                    })
                    
                    if uvQuestionsAreShown {
                        Text("Hur känslig skulle du säga att du är mot solen?")
                            .font(.title3)
                            .multilineTextAlignment(.leading)
                        HStack{
                            OptionButton(label: "Lite känslig", action: {
                                Task {
                                    uvQuestionsAreShown = false
                                    uvStackIsShown = true
                                    uvValue = 0
                                    uv = await uvManager.fetchUV(city: city, uvValue: uvValue)
                                }
                            })
                            OptionButton(label: "Ganska känslig", action: {
                                Task {
                                    uvQuestionsAreShown = false
                                    uvStackIsShown = true
                                    uvValue = 1
                                    uv = await uvManager.fetchUV(city: city, uvValue: uvValue)
                                }
                            })
                            OptionButton(label: "Väldigt känslig", action: {
                                Task {
                                    uvQuestionsAreShown = false
                                    uvStackIsShown = true
                                    uvValue = 2
                                    uv = await uvManager.fetchUV(city: city, uvValue: uvValue)
                                }
                            })
                        }
                    }
                    
                    InfoStack(text: uv, isShown: uvStackIsShown,
                              update: {
                        Task {
                            uv = await uvManager.fetchUV(city: city, uvValue: uvValue)
                        }
                    }, cancel: {
                        Task {
                            uvButtonIsShown = true
                            uvStackIsShown = false
                        }
                    })
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading){
                    Text("Vädret just nu (" + hour + ":00)")
                        .fontWeight(.semibold)
                        .padding(.bottom)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                    CityTitle(text: "Stockholm")
                    CityWeather(text: stockholmWeather)
                    CityTitle(text: "Göteborg")
                    CityWeather(text: gothenburgWeather)
                    CityTitle(text: "Malmö")
                    CityWeather(text: malmoWeather)
                }
                .padding(.horizontal)
                
                Image("sweden-map")
                    .overlay(
                        ZStack {
                            ZStack {
                                WeatherIcon(icon: stockholmIcon, x: 55.0, y: 115.0)
                                WeatherIcon(icon: gothenburgIcon, x: -90.0, y: 170.0)
                                WeatherIcon(icon: malmoIcon, x: -60.0, y: 267.0)
                                WeatherIcon(icon: kalmarIcon, x: 0.0, y: 225.0)
                                WeatherIcon(icon: visbyIcon, x: 52.0, y: 195.0)
                                WeatherIcon(icon: jonkopingIcon, x: -32.0, y: 170.0)
                                WeatherIcon(icon: karlstadIcon, x: -50.0, y: 105.0)
                                WeatherIcon(icon: gavleIcon, x: 30.0, y: 60.0)
                                WeatherIcon(icon: moraIcon, x: -20.0, y: 45.0)
                                WeatherIcon(icon: sundsvallIcon, x: 30.0, y: -10.0)
                            }
                            ZStack {
                                WeatherIcon(icon: ostersundIcon, x: -25.0, y: -50.0)
                                WeatherIcon(icon: umeaIcon, x: 75.0, y: -80.0)
                                WeatherIcon(icon: luleaIcon, x: 100.0, y: -145.0)
                                WeatherIcon(icon: tarnabyIcon, x: -20.0, y: -150.0)
                                WeatherIcon(icon: kirunaIcon, x: 55.0, y: -245.0)
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
