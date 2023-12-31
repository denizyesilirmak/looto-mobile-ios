//
//  LoginResponseModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 5.11.2023.
//

import Foundation

struct LoginBody: Encodable {
    let email: String
}

struct LoginOtpBody: Encodable {
    let email: String
    let otp: String
}

struct LoginResponse: Codable {
    let success: Bool
    let message: String
    let data: UserItem
}

struct UserItem: Codable {
    let email: String
}
