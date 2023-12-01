//
//  LoginOtpResponseModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 5.11.2023.
//

import Foundation

struct LoginOtpResponse: Codable {
    let success: Bool
    let message: String
    let data: LoginOtpData
}

struct LoginOtpData: Codable {
    let token: String
    let email: String
}
