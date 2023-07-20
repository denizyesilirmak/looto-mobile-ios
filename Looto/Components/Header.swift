//
//  Header.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.11.2023.
//

import Foundation

import SwiftUI

struct Header: View {
    @ObservedObject var vm: BalanceViewModel
    
    var body: some View {
            VStack {
                HStack {
                    Image("LogoHorizontal")
                        .resizable()
                        .frame(width: 130, height: 42)
                        .padding(.bottom, 20)
                    Spacer()
                    if(vm.hasError) {
                        NavigationLink(destination: LoginView()) {
                            HStack {
                                Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading, 20)
                                .foregroundColor(.white)
                                
                                Text("Login")
                                .foregroundColor(.white)
                            }
                        }
                    }else {
                        NavigationLink(destination: ProfileView(vm: vm)) {
                            HStack {
                                Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading, 20)
                                .foregroundColor(.white)
                                if let balance = vm.balance?.balance {
                                    VStack {
                                        Text("Balance")
                                        Text(String(format: "%.2f TRY", balance))
                                        .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                    }


                }
                .padding(10)                
            }
            .task {
                do {
                    try await vm.getBalance()
                    print("task-getbalance", vm.balance?.balance)
                }
                catch {
                    print(error.localizedDescription)
                }
            }
    }
}
