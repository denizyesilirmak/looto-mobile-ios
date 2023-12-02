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
