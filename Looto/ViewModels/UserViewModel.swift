//
//  CityViewModel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.08.2023.
//

import Foundation

@MainActor

class UserViewModel: ObservableObject {
    
    @Published var user: UserItem = UserItem(_id: "", email: "", name: "", lastname: "", phone: "", city: "", birthdate: "", __v: 0)
    @Published var errorMessage = ""
    @Published var hasError = false
    
    
    func getUser() async {
        guard let data = try? await APIService().getUser() else {
            self.user = UserItem(_id: "", email: "", name: "", lastname: "", phone: "", city: "", birthdate: "", __v: 0)
            self.hasError = true
            self.errorMessage = "Server Error"
            return
        }
        
        self.user = data.data
    }
    
}
