//
//  BalanceModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 28.11.2023.
//

import Foundation

struct BalanceModel: Decodable {
    let success: Bool?
    let email: String?
    let userId: String?
    var balance: Double?
    let balanceDate: Date?
    
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case email = "email"
        case userId = "userId"
        case balance = "balance"
        case balanceDate = "date"
    }
}
