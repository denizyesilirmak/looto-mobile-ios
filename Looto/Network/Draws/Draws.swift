//
//  Draws.swift
//  Looto
//
//  Created by deniz.yesilirmak on 2.12.2023.
//

import Foundation

struct ApiServiceDraws {
    @MainActor func fetchRecentDraws() async throws -> RecentDrawsModel {
        guard let url = URL(string:  "\(BASE_URL)/draws/recents") else{
            throw APIError.invalidUrl
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else{
            throw APIError.requestError
        }
                
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw APIError.statusNotOk
        }
        
        guard let result = try? JSONDecoder().decode(RecentDrawsModel.self, from: data) else {
            throw APIError.decodingError
        }
        
        return result
    }
}
