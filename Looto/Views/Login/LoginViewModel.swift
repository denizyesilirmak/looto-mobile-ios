//
//  CityViewModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.08.2023.
//

import Foundation

@MainActor

class LoginResponseViewModel: ObservableObject {
    
    @Published var loginResponse: LoginResponse = LoginResponse(success: false, message: "", data: UserItem(email: ""))
    @Published var errorMessage = ""
    @Published var hasError = false
    @Published var isOtpRecieved = false

    func login(email: String) async {
        guard let data = try? await ApiServiceAuthentication().userLogin(email: email) else {
            self.loginResponse = LoginResponse(success: false, message: "", data: UserItem(email: ""))
            self.hasError = true
            self.errorMessage = "Server Error"
            return
        }

        self.isOtpRecieved = true

        print("request: \(email)")
        print("data: \(data)")
        
        self.loginResponse = data
    }
}
