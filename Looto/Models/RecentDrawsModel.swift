//
//  RecentDrawsModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 16.11.2023.
//

import Foundation

struct GameModel: Codable {
    let _id: String
    let name: String
    let prize: Int
    let gameCode: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case _id = "_id"
        case name = "name"
        case prize = "prize"
        case gameCode = "gameCode"
        case image = "image"
    }
}

struct DrawModel: Identifiable, Codable {
    let _id: String
    let game: GameModel
    let numbers: [Int]
    let extraNumbers: [Int?]
    let createdAt: String
    let v: Int
    var id: String {
        _id
    }

    enum CodingKeys: String, CodingKey {
        case _id = "_id"
        case game = "game"
        case numbers = "numbers"
        case extraNumbers = "extraNumbers"
        case createdAt = "createdAt"
        case v = "__v"
    }
}

struct RecentDrawsModel: Codable {
    let success: Bool
    let count: Int
    let draws: [DrawModel]
}
