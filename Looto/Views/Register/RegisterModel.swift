//
//  RegisterModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 25.12.2023.
//

import Foundation

struct RegisterResponse: Decodable {
    let success: Bool
    let message: String
    let data: RegisterData
}

struct RegisterData: Decodable {
    let email, emailIdentifier, expiresAt, createdAt: String
    let type: String
}

struct RegisterBody: Encodable {
    let email, name, lastName, phoneNumber: String
    let cityId, birthDate: String
}

struct RegisterOtpResponse: Decodable {
    let success: Bool
    let message: String
    let data: DataClassOtp
}

struct DataClassOtp: Decodable {
    let user: UserOtp
    let token: String
}

struct UserOtp: Decodable {
    let name, lastName, email, phoneNumber: String
    let activated: Bool
    let cityID, birthDate: String
    let privacyPolicy: Bool
    let balance: Int
    let id, createdAt, expireAt: String
    let v: Int
}

struct RegisterOtpBody: Encodable {
    let email, name, lastName, phoneNumber: String
    let cityID, birthDate, otp: String
}
