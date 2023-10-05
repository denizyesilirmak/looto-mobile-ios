//
//  ApiService.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.08.2023.
//

import Foundation

enum APIError: Error {
    case invalidUrl, requestError, decodingError, statusNotOk
}

let BASE_URL: String = "https://sea-turtle-app-qpyzd.ondigitalocean.app/api/v1"

struct APIService {
    /// -------------------
    /// Get cities
    /// - Returns: CityResponse
    /// - Throws: APIError
    /// Get cities array from API
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

    /// -------------------
    /// userLogin
    /// - Parameter email: String
    /// - Returns: LoginResponse
    /// - Throws: APIError
    /// Send otp to user email
    
    struct LoginBody: Encodable {
        let email: String
    }
    func userLogin(email: String) async throws -> LoginResponse {
        let body = LoginBody(email: email)
        
        guard let url = URL(string:  "\(BASE_URL)/auth/login/email") else{
            throw APIError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let (data, response) = try? await URLSession.shared.data(for: request) else{
            print("error requestError")
            throw APIError.requestError
        }
                
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            print("error statusNotOk")
            throw APIError.statusNotOk
        }
        
        guard let result = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
            print("error decodingError")
            throw APIError.decodingError
        }
        
        return result
    }
    
    /// -------------------
    /// userLoginOtp
    /// - Parameters:
    ///   - otp: String
    ///   - email: String
    /// - Returns: LoginOtpResponse
    /// - Throws: APIError
    /// Verify otp and login user and get token
    struct LoginOtpBody: Encodable {
        let email: String
        let otp: String
    }
    
    func userLoginOtp(otp: String, email: String) async throws -> LoginOtpResponse {
        let body = LoginOtpBody(email: email, otp: otp)
        
        guard let url = URL(string:  "\(BASE_URL)/auth/login/email/otp") else{
            throw APIError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let (data, response) = try? await URLSession.shared.data(for: request) else{
            print("error requestError")
            throw APIError.requestError
        }
                
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            print("error statusNotOk")
            throw APIError.statusNotOk
        }
        
        guard let result = try? JSONDecoder().decode(LoginOtpResponse.self, from: data) else {
            print("error decodingError")
            throw APIError.decodingError
        }
        
        return result
    }
    
    @MainActor func fetchGameList() async throws -> GameListResponse {
        guard let url = URL(string:  "\(BASE_URL)/games") else{
            throw APIError.invalidUrl
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else{
            throw APIError.requestError
        }
                
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw APIError.statusNotOk
        }
        
        guard let result = try? JSONDecoder().decode(GameListResponse.self, from: data) else {
            throw APIError.decodingError
        }
        
        return result
    }

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
