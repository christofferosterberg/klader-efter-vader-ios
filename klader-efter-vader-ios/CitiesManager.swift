////
////  CitiesManager.swift
////  klader-efter-vader-ios
////
////  Created by Christoffer on 2022-07-22.
////
//
//import Foundation
//
//struct City: Codable {
//    var id: Int
//    var latitude, longitude: Double
//    var name: String
//}
//
//struct Cities: Codable {
//    var cities: [City]
//}
//
//
//@MainActor class CitiesManager: ObservableObject {
//    
//    @Published var resultCities = [City]()
//    
//    func getData() {
//        guard let url = URL(string: "https://klader-efter-vader.herokuapp.com/cities") else {
//            print("Felaktig url")
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            
//            guard let data = data else {
//                print("kunde inte hämta data")
//                
//                DispatchQueue.main.async {
//                    self.resultCities = []
//                }
//                return
//            }
//            
//            do {
//                let cities = try JSONDecoder().decode(Cities.self, from: data)
//                
//                DispatchQueue.main.async {
//                    print(cities)
//                    self.resultCities = cities.cities
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    print("\(error)")
//                    self.resultCities = []
//                }
//            }
//        }
//    }
//}
