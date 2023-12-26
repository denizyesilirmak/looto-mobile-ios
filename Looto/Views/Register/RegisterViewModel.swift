//
//  RegisterViewModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 25.12.2023.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var registerResponse: RegisterResponse = 
    RegisterResponse(
        success: false, 
        message: "",
        data: RegisterData(
            email: "",
            emailIdentifier: "",
            expiresAt: "",
            createdAt: "",
            type: "")
        )
    
    @Published var errorMessage = ""
    @Published var hasError = false

    func register(email: String, name: String, lastname: String, phone: String, city: String, birthday: String) async {
        guard let data = try? await ApiServiceAuthentication().userRegister(email: email, name: name, lastname: lastname, phone: phone, city: city, birthday: birthday) else {
            
            self.registerResponse = RegisterResponse(
                success: false, 
                message: "",
                data: RegisterData(
                    email: "",
                    emailIdentifier: "",
                    expiresAt: "",
                    createdAt: "",
                    type: "")
                )
            self.hasError = true
            self.errorMessage = "Server Error"
            return
        }
        
        self.registerResponse = data
        print(data)
    }

}
