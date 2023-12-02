//
//  CityViewModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.08.2023.
//

import Foundation

@MainActor

class CitiesViewModel: ObservableObject {
    
    @Published var cities: [CityItem] = []
    @Published var errorMessage = ""
    @Published var hasError = false
    
    func getCities() async {
        guard let data = try? await ApiServiceGeneral().getCities() else {
            self.cities = []
            self.hasError = true
            self.errorMessage = "Server Error"
            return
        }
        
        self.cities = data.data
    }
    
}
