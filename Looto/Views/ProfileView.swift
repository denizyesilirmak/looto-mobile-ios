//
//  ProfileView.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.11.2023.
//

import Foundation

import SwiftUI

struct ProfileView: View {
    @AppStorage("token") private var userToken: String?
    @ObservedObject var vm: BalanceViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: Color.accentColor, location: 0),
                Gradient.Stop(color: .black, location: 0.55),
            ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                Header(vm: vm)
                HStack {
                    Button(action: {
                        Task {
                            do {
                                await vm.addBalance(amount: 100)
                            }
                        }
                    }, label: {
                        Text("100 TL")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    })
                    Button(action: {
                        Task {
                            do {
                                await vm.addBalance(amount: 200)
                            }
                        }
                    }, label: {
                        Text("200 TL")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    })   
                    Button(action: {
                        Task {
                            do {
                                await vm.addBalance(amount: 500)
                                print("addBalance->balance", vm.balance?.balance)
                            }
                        }
                    }, label: {
                        Text("500 TL")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    })                 
                }
                Button(action: {
                    
                }, label: {
                    Text("Install Credits")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .frame(width: .infinity, height: 100, alignment: .leading)
                })
                Spacer()
                Button(action: {
                    userToken = nil
                }, label: {
                    Text("Logout")
                })
                
            }
            .padding()
        }
    }
}
