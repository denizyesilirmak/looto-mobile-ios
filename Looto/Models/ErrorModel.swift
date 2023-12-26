//
//  ErrorModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 26.12.2023.
//

import Foundation

struct ErrorModel: Decodable {
    let success: Bool
    let message: String
    let code: Int
}
