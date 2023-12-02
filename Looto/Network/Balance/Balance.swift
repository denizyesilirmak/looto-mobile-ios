//
//  Balance.swift
//  Looto
//
//  Created by deniz.yesilirmak on 2.12.2023.
//

import Foundation

struct ApiServiceBalance {
    
    @MainActor func fetchUserBalance(userToken: String) async throws -> BalanceModel {
        guard let url = URL(string: "\(BASE_URL)/balance") else {
            throw NSError(domain: "Invalid Url", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("token \(userToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        // Decode the JSON response into BalanceModel
        let balanceModel = try JSONDecoder().decode(BalanceModel.self, from: data)
        return balanceModel
    }
    
    struct AddBalanceBody: Encodable {
        let amount: Int32
    }
    
    @MainActor func updateUserBalance(userToken: String, amount: Int32) async throws -> BalanceModel {
        let body = AddBalanceBody(amount: amount)
        
        guard let url = URL(string: "\(BASE_URL)/balance/add") else {
            throw NSError(domain: "Invalid Url", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("token \(userToken)", forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONEncoder().encode(body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        // Decode the JSON response into BalanceModel
        let balanceModel = try JSONDecoder().decode(BalanceModel.self, from: data)
        return balanceModel
    }
}
