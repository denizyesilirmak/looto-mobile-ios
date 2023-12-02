//
//  EditProfileModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 3.12.2023.
//

import Foundation

struct ProfileModel: Decodable {
    let success: Bool
    let message: String
    let data: UserProfile

    enum CodingKeys: String, CodingKey {
        case success, message
        case data = "data"
    }
}

struct UserProfile: Decodable {
    let id, name, lastName, email: String
    let phoneNumber: String
    let activated: Bool
    let cityID, birthDate: String
    let privacyPolicy: Bool
    let balance: Int
    let createdAt, expireAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, lastName, email, phoneNumber, activated 
        case cityID = "cityId"
        case birthDate, privacyPolicy, balance, createdAt, expireAt
        case v = "__v"
    }
}
