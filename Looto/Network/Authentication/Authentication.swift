//
//  Authentication.swift
//  Looto
//
//  Created by deniz.yesilirmak on 2.12.2023.
//

import Foundation

struct ApiServiceAuthentication {
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
}
