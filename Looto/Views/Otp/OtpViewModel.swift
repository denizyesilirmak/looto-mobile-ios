//
//  LoginOtpResponseViewModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 6.11.2023.
//

import Foundation

class LoginOtpResponseViewModel: ObservableObject {
    
    @Published var loginOtpResponse: LoginOtpResponse = LoginOtpResponse(success: false, message: "", data: LoginOtpData(token: "", email: ""))
    @Published var errorMessage = ""
    @Published var hasError = false
    @Published var isOtpVerified = false
    
    func loginOtp(email: String, otp: String) async {
        guard let data = try? await APIService().userLoginOtp(otp: otp, email: email) else {
            self.loginOtpResponse = LoginOtpResponse(success: false, message: "", data: LoginOtpData(token: "", email: ""))
            self.hasError = true
            self.errorMessage = "Server Error"
            return
        }
        
        self.isOtpVerified = true
        
        print("data: \(data)")
        
        self.loginOtpResponse = data
    }
}
