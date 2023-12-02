//
//  General.swift
//  Looto
//
//  Created by deniz.yesilirmak on 2.12.2023.
//

import Foundation

struct ApiServiceGeneral{
    func getCities() async throws -> CityResponse {
        
        guard let url = URL(string:  "\(BASE_URL)/cities") else{
            throw APIError.invalidUrl
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else{
            throw APIError.requestError
        }
                
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw APIError.statusNotOk
        }
        
        guard let result = try? JSONDecoder().decode(CityResponse.self, from: data) else {
            throw APIError.decodingError
        }
        
        return result
    }
}
