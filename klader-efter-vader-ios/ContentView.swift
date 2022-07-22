//
//  ContentView.swift
//  klader-efter-vader-ios
//
//  Created by Christoffer on 2022-07-12.
//

import SwiftUI

struct City: Codable {
    var id: Int
    var latitude, longitude: Double
    var name: String
}

struct Cities: Codable {
    var cities: [City]
}

struct ContentView: View {
    @State private var cities = [City]()
    
//    @State private var joke: String = ""
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
                    Text(" ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    Text("Göteborg ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    Text(" ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    Text("Malmö ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    Text(" ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal)

                Image("sweden-map")


            } // Outer VStack
            .padding([.leading, .bottom, .trailing])
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)

        } // ScrollView
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.788, green: 0.949, blue: 1.0)/*@END_MENU_TOKEN@*/)
    }
}
        
        
//        Text(joke)
//                Button {
//                    Task {
//                        let (data, _) = try await URLSession.shared.data(from: URL(string:"https://api.chucknorris.io/jokes/random")!)
//                        let decodedResponse = try? JSONDecoder().decode(Joke.self, from: data)
//                        joke = decodedResponse?.value ?? ""
//                    }
//                } label: {
//                    Text("Fetch Joke")
//                }
//    }
//}
        

//        List(cities, id: \.cityId) { item in
//            VStack(alignment: .leading) {
//                let latitude = "\(item.latitude)"
//                let longitude = "\(item.longitude)"
//                Text(item.cityName)
//                    .font(.headline)
//                Text("lat: " + latitude + " long: " + longitude)
//            }
//        }
//        .task {
//            await loadWeather()
//        }
        
//    } // body
    
//    func loadWeather() async {
//        guard let url = URL(string: "https://klader-efter-vader.herokuapp.com/cities") else {
//            print("Felaktigt anrop")
//            return
//        }
//
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                print(data)
//                if let decodedResponse = try? JSONDecoder().decode(Cities.self, from: data) {
//                    // we have good data – go back to the main thread
//                    DispatchQueue.main.async {
//                        // update our UI
//                        self.cities = decodedResponse.cities
//                    }
//
//                    // everything is good, so we can exit
//                    return
//                }
//            }
//
//            // if we're still here it means there was a problem
//            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//        }.resume()
//
//        //        do {
//        //            let (data, _) = try await URLSession.shared.dataTask(with: url)
//        //
//        //            if let decodedCities = try? JSONDecoder().decode(Cities.self, from: data) {
//        //                cities = decodedCities.cities
//        //                print(cities)
//        //            }
//        //        } catch {
//        //            print("Felaktig data")
//        //        }
//    }
//}
//
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
//
//struct Joke: Codable {
//    let value: String
//}
