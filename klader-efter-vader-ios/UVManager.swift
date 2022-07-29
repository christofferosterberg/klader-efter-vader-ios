//
//  UVManager.swift
//  klader-efter-vader-ios
//
//  Created by Christoffer on 2022-07-28.
//

import Foundation

@MainActor class UVManager: ObservableObject {
    func fetchUV(city: String, uvValue: Int) async -> String {
        
        
        guard let url = URL(string: host + "uv-info/" + city + "/" + String(uvValue)) else {
            print("Invalid URL")
            return ""
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedUV = try JSONDecoder().decode(String.self, from: data)
            
            return decodedUV
        } catch {
            print("Avkodning av allergi gick snett")
        }
        return ""
    }
    
}
