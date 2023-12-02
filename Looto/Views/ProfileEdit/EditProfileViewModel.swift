//
//  EditProfileViewModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 3.12.2023.
//

import Foundation

import SwiftUI

class EditProfileViewModel: ObservableObject {
    @AppStorage("token") private var userToken: String?
    @Published var profile: UserProfile?
    @Published var errorMessage = ""
    @Published var hasError = false
    
    func fetchProfile() async {
        guard let userToken = userToken, let data = try? await ApiServiceProfile().fetchProfile(userToken: userToken) else {
            self.hasError = true
            self.errorMessage = "Server Error/getRecentDraws"
            return
        }
                
        self.hasError = false
        self.profile = data.data
    }
    
    func updateProfile(name: String, lastName: String, email: String, phone: String, cityId: String) async {
        guard let userToken = userToken, let data = try? await ApiServiceProfile().updateProfile(userToken: userToken, body: ApiServiceProfile.updateUserBody(name: name, lastName: lastName, email: email, phone: phone, cityId: cityId)) else {
            self.hasError = true
            self.errorMessage = "Server Error/getRecentDraws"
            return
        }
                
        self.hasError = false
        self.profile = data.data
    }
}
