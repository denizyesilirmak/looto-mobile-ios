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
    @State var shouldNavigate: Bool = true
    
    var body: some View {
                HStack {
                    Image("LogoHorizontal")
                    .resizable()
                    .frame(width: 110, height: 36)
                    .padding(.leading, 0)
                    Spacer()
                    if(shouldNavigate) {
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
                            NavigationLink(destination: ProfileView(balanceVm: vm)) {
                                HStack {
                                    Image(systemName: "person.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(.leading, 20)
                                    .foregroundColor(.white)
                                    if let balance = vm.balance?.balance {
                                        VStack {
                                            Text(String(format: "%.2f cr", balance))
                                            .foregroundColor(.white)
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        HStack {
                            Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.leading, 20)
                            .foregroundColor(.white)
                             if let balance = vm.balance?.balance {
                                    VStack {
                                        Text(String(format: "%.2f cr", balance))
                                        .foregroundColor(.white)
                                    }
                                }
                        }
                    }


                }
                .padding(10)
                .task {
                    do {
                        try await vm.getBalance()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            Header(vm: BalanceViewModel())
        }
    }
}
