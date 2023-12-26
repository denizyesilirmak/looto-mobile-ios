//
//  LoginView.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.08.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm = LoginResponseViewModel()
    @State var email: String = ""
    @State private var toast: Toast? = nil

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: Color.accentColor, location: 0),
                Gradient.Stop(color: .black, location: 0.55),
            ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("Looto")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 20)
                CustomTextField(label: "Email", placeholder: "Enter your email", iconName: "mail", content: $email)
                    .padding(.bottom, 20)
                Button(action: {
                        Task {
                            await vm.login(email: email)
                            if vm.hasError {
                                // show alert here
                                print("error")
                                toast = Toast(style: .error, message: vm.errorMessage, duration: 3)

                            }
                        }
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(10.0)
                            .padding(.bottom, 24)
                            .padding(.top, 20)
                    }
                NavigationLink(
                    destination: RegisterView(),
                    label: {
                        Text("Not a member? Sign up here!")
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    })
                Spacer()
                HStack {
                    Image("LogoHorizontal")
                        .resizable()
                        .frame(width: 130, height: 42)
                        .padding(.bottom, 20)
                }
            }
            .padding()
        }
        .toastView(toast: $toast)
        .background(
            NavigationLink(
                destination: OtpView(numberOfFields: 4),
                isActive: $vm.isOtpRecieved,
                label: {
                    EmptyView()
                })
        )
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
