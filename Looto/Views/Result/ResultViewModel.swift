//
//  ResultViewModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 2.12.2023.
//

import Foundation

import SwiftUI

final class ResultViewModel: ObservableObject {
    @AppStorage("token") private var userToken: String?
    
    @Published var tickets: [TicketItem] = []
    @Published var errorMessage = ""
    @Published var hasError = false
    
    func fetchTickets() async {
        guard let userToken = userToken, let data = try? await ApiServiceTickets().fetchTickets(userToken: userToken) else {
            self.hasError = true
            self.errorMessage = "Server Error/fetchTickets"
            return
        }
        
        self.tickets = data.data.tickets
    }
}
