//
//  CitiesManager.swift
//  klader-efter-vader-ios
//
//  Created by Christoffer on 2022-08-02.
//

import Foundation

struct City: Codable {
    let id: Int
    let latitude, longitude : Double
    let name: String
}

@MainActor class CityManager: ObservableObject {
    func fetchCities() async -> [City] {

        
        var components = URLComponents()
        components.path = "cities"
        
        guard let url = URL(string: host + components.percentEncodedPath) else {
            print("Invalid URL")
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedCities = try JSONDecoder().decode([City].self, from: data)
            
            return decodedCities
        } catch {
            print("Avkodning av kläder gick snett")
        }
        return []
    }
    
    func findClosestCity(latitude: Double, longitude: Double, cities: [City]) -> String {
        print("din position: " + String(latitude) + " " + String(longitude))
        var closestCity = cities[0]
        var closestDistance = sqrt(pow(cities[0].latitude - latitude,2) + pow(cities[0].longitude - longitude,2))
        for city in cities {
            
            let distance = sqrt(pow(city.latitude - latitude,Double(2)) + pow(city.longitude - longitude,Double(2)))
            print("Stad: " + city.name + " Avstånd: " + String(distance))
            
            if distance < closestDistance {
                closestCity = city
                closestDistance = distance
            }
        }
        return closestCity.name
    }
    
}
