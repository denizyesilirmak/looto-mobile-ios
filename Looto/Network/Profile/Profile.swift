//
//  Profile.swift
//  Looto
//
//  Created by deniz.yesilirmak on 3.12.2023.
//

import Foundation

struct ApiServiceProfile {
    @MainActor func fetchProfile(userToken: String) async throws -> ProfileModel {
        guard let url = URL(string: "\(BASE_URL)/profile/user") else {
            throw NSError(domain: "Invalid Url", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("token \(userToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let result = try JSONDecoder().decode(ProfileModel.self, from: data)
        
        return result
    }
    
    struct updateUserBody: Encodable {
        let name: String
        let lastName: String
        let email: String
        let phone: String
        let cityId: String
    }

    @MainActor func updateProfile(userToken: String, body: updateUserBody) async throws -> ProfileModel {
        guard let url = URL(string: "\(BASE_URL)/profile/user") else {
            throw NSError(domain: "Invalid Url", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("token \(userToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let jsonData = try encoder.encode(body)
        request.httpBody = jsonData
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let result = try JSONDecoder().decode(ProfileModel.self, from: data)
        
        return result
    }
}
