//
//  ClothesManager.swift
//  klader-efter-vader-ios
//
//  Created by Christoffer on 2022-07-27.
//

import Foundation

@MainActor class ClothesManager: ObservableObject {
    func fetchClothes(city: String) async -> String {

        
        var components = URLComponents()
        components.path = "clothes-info/" + city
        
        guard let url = URL(string: host + components.percentEncodedPath) else {
            print("Invalid URL")
            return ""
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedClothes = try JSONDecoder().decode(String.self, from: data)
            
            return decodedClothes
        } catch {
            print("Avkodning av kläder gick snett")
        }
        return ""
    }
    
}
