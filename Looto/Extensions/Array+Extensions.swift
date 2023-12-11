//
//  Array+Extensions.swift
//  Looto
//
//  Created by deniz.yesilirmak on 10.12.2023.
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
