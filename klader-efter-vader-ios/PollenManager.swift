//
//  PollenManager.swift
//  klader-efter-vader-ios
//
//  Created by Christoffer on 2022-07-28.
//

import Foundation

@MainActor class PollenManager: ObservableObject {
    func fetchPollen(city: String, allergy: Int) async -> String {
        
        
        var components = URLComponents()
        components.path = "pollen-info/" + city + "/" + String(allergy)
        
        guard let url = URL(string: host + components.percentEncodedPath) else {
            print("Invalid URL")
            return ""
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedAllergy = try JSONDecoder().decode(String.self, from: data)
            
            return decodedAllergy
        } catch {
            print("Avkodning av allergi gick snett")
        }
        return ""
    }
    
}
