//
//  GameListModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 6.11.2023.
//

import Foundation

struct GameListResponse: Codable {
    let success: Bool
    let gameList: [Game]
}

struct Game: Codable, Identifiable, Hashable {
    let id, name, description: String
    let columnPrice, prize: Int
    let image: String
    let status: String
    let mininumNumber, maximumNumber, requriedNumbers, extraNumbers: Int
    let currency, cronExpression, cronExpressionDescription, gameCode: String
    let gameType, createdAt: String
    let v: Int
    let nextDrawDate: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, description, columnPrice, prize, image, status, mininumNumber, maximumNumber, requriedNumbers, extraNumbers, currency, cronExpression, cronExpressionDescription, gameCode, gameType, createdAt
        case v = "__v"
        case nextDrawDate
    }
}
