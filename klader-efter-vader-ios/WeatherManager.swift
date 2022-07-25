//
//  WeatherManager.swift
//  klader-efter-vader-ios
//
//  Created by Christoffer on 2022-07-25.
//



import Foundation

struct Weather: Codable {
    let city_id: Int
    let city_name: String
    let cloudiness, day: Int
    let description, fetched: String
    let hour, id, month: Int
    let precipitation: Double
    let temperature: Double
    let value: Int
    let wind_speed: Double
    let year: Int
}

@MainActor class WeatherManager: ObservableObject {
    
    var wantedCities = [
        "Stockholm",
        "Göteborg",
        "Malmö", "Kalmar",
        "Jönköping",
        "Visby",
        "Karlstad",
        "Gävle",
        "Mora",
        "Sundsvall",
        "Östersund",
        "Umeå",
        "Luleå",
        "Tärnaby",
        "Kiruna"
    ]

    func fetchWeather() async -> [Weather]{
        print("hej")
        guard let wantedCity = try? JSONEncoder().encode(wantedCities) else {
            print("Failed to encode order")
            return []
        }
        
        guard let url = URL(string: host + "weather") else {
            print("Invalid URL")
            return []
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            print("hello")
            let (data, _) = try await URLSession.shared.upload(for: request, from: wantedCity)
//            let (data, _) = try await URLSession.shared.data(from: url)
            print("hello")
            let decodedWeather = try JSONDecoder().decode([Weather].self, from: data)
            
            return decodedWeather
        } catch {
            print("Avkodning av vädret gick snett")
        }
        return []
    }
    
    func findWeather(weathers: [Weather], targetCity: String) -> String {
        for weather in weathers {
            if weather.city_name == targetCity {
                return weather.description
            }
        }
        return ""
    }
    
}
