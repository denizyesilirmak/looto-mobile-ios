//
//  ProfileView.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.11.2023.
//

import Foundation

import SwiftUI

enum PaymentAmount: Int32 {
    case oneHundred = 100
    case twoHundred = 200
    case fiveHundred = 500
}

struct ProfileView: View {
    @AppStorage("token") private var userToken: String?
    @ObservedObject var balanceVm: BalanceViewModel
    @State var paymentAmount: PaymentAmount = .oneHundred
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: Color.accentColor, location: 0),
                Gradient.Stop(color: .black, location: 0.55),
            ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                Header(vm: balanceVm, shouldNavigate: false)
                HStack {
                    Button(action: {
                        Task {
                            do {
                                paymentAmount = .oneHundred
                            }
                        }
                    }, label: {
                        Text("100 TL")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding()
                            .background(paymentAmount == .oneHundred ? Color.accentColor : Color.gray)
                            .cornerRadius(10)
                            //scale animation
                            .scaleEffect(paymentAmount == .oneHundred ? 1 : 0.9)
                    })
                    Button(action: {
                        Task {
                            do {
                                paymentAmount = .twoHundred
                            }
                        }
                    }, label: {
                        Text("200 TL")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding()
                            .background(paymentAmount == .twoHundred ? Color.accentColor : Color.gray)
                            .cornerRadius(10)
                            .scaleEffect(paymentAmount == .twoHundred ? 1 : 0.9)
                    })   
                    Button(action: {
                        Task {
                            do {
                                paymentAmount = .fiveHundred
                            }
                        }
                    }, label: {
                        Text("500 TL")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding()
                            .background(paymentAmount == .fiveHundred ? Color.accentColor : Color.gray)
                            .cornerRadius(10)
                            .scaleEffect(paymentAmount == .fiveHundred ? 1 : 0.9)
                    })                 
                }
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                Button(action: {
                    Task {
                        do {
                            await balanceVm.addBalance(amount: paymentAmount.rawValue)
                        }
                    }
                }, label: {
                    Text("Install Credits")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 16, leading: 80, bottom: 16, trailing: 80))
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                })
                .frame(height: 100)
                ProfileSection()
                Spacer()
                Button(action: {
                    userToken = nil
                    UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: ContentView())
                }, label: {
                    Text("Logout")
                })
            }
            .padding()
        }
    }
}

struct HeaderPreview: PreviewProvider {
    @StateObject var balanceVm = BalanceViewModel()

    static var previews: some View {
        ProfileView(balanceVm: BalanceViewModel())
    }
}
