//
//  CityModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 5.11.2023.
//

import Foundation

struct CityItem: Codable, Identifiable, Hashable {
    let _id: String
    let code: Int
    let name: String
    let latitude: String
    let longitude: String
    let population: Int
    let region: String
    let __v: Int
    var id: String {
        _id
    }
}

struct CityResponse: Codable {
    let data: [CityItem]
    let success: Bool
    let records: Int
}
