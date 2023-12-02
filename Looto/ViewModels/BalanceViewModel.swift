//
//  BalanceViewModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 28.11.2023.
//

import Foundation

import SwiftUI

class BalanceViewModel: ObservableObject {
    
    @Published var balance: BalanceModel?
    @Published var errorMessage = ""
    @Published var hasError = false
    @AppStorage("token") private var userToken: String?
    
    func getBalance() async {
        guard let userToken = userToken, let data = try? await ApiServiceBalance().fetchUserBalance(userToken: userToken) else {
            self.hasError = true
            self.errorMessage = "Server Error/getRecentDraws"
            return
        }
                
        self.hasError = false
        self.balance = data
    }
    
    func addBalance(amount: Int32) async {
        guard let userToken = userToken, let data = try? await ApiServiceBalance().updateUserBalance(userToken: userToken, amount: amount) else {
            self.hasError = true
            self.errorMessage = "Server Error/addBalance"
            return
        }
        
        self.hasError = false
        self.balance = data
    }
}

