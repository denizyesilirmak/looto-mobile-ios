//
//  GamesViewModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 6.11.2023.
//

import Foundation

class GameViewModel: ObservableObject {
    
    @Published var games: [Game] = []
    @Published var errorMessage = ""
    @Published var hasError = false
    @Published var selectedNumbers: [Int] = []
    let maxNumbers = 30
    
    // Given the selected numbers, create chunks of up to 6 items for the 6x6 grid
    var selectedNumbersChunks: [[Int]] {
        selectedNumbers.chunked(into: 5)
    }

    func selectNumber(_ number: Int) {
        if selectedNumbers.contains(number) {
            selectedNumbers.removeAll { $0 == number }
        } else if selectedNumbers.count < maxNumbers {
            selectedNumbers.append(number)
        }
    }
    
    func getGames() async {
        guard let data = try? await ApiServiceGames().fetchGameList() else {
            self.games = []
            self.hasError = true
            self.errorMessage = "Server Error/getGames"
            return
        }
        
        self.games = data.gameList
    }
}
