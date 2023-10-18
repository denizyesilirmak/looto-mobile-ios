//
//  GamesViewModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 6.11.2023.
//

import Foundation

class GameCarouselViewModel: ObservableObject {
    
    @Published var games: [Game] = []
    @Published var errorMessage = ""
    @Published var hasError = false
    
    func getGames() async {
        guard let data = try? await APIService().fetchGameList() else {
            self.games = []
            self.hasError = true
            self.errorMessage = "Server Error/getGames"
            return
        }
        
        self.games = data.gameList
    }
}
