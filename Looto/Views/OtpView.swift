//
//  OtpView.swift
//  Looto
//
//  Created by deniz.yesilirmak on 16.08.2023.
//

import SwiftUI

struct OtpView: View {
    let numberOfFields: Int
    @State var enterValue: [String]
    @FocusState private var fieldFocused: Int?
    @StateObject private var vm = LoginOtpResponseViewModel()
    @AppStorage("token") private var userToken: String?
    
    init(numberOfFields: Int){
        self.numberOfFields = numberOfFields
        self.enterValue = Array(repeating: "", count: numberOfFields)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: Color.accentColor, location: 0),
                Gradient.Stop(color: .black, location: 0.55),
            ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                Text("OTP Verification")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 20)
                Text("Please enter the verification code sent to email address")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                HStack {
                    ForEach(0..<numberOfFields, id: \.self) { index in
                        TextField("", text: $enterValue[index])
                            .frame(width: 60, height: 60)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .focused($fieldFocused, equals: index)
                            .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                            .cornerRadius(10)
                            .onChange(of: enterValue[index]) { newValue in
                                if !newValue.isEmpty {
                                    if(index == numberOfFields - 1){
                                        fieldFocused = nil
                                    }else{
                                        fieldFocused = (fieldFocused ?? 0) + 1
                                    }
                                }
                                else {
                                    fieldFocused = (fieldFocused ?? 0) - 1
                                }
                            }
                    }
                }
                Spacer()
                Button(action: {
                    print("verify tapped!")
                    Task {
                        await vm.loginOtp(email: "dnzyslrmk@gmail.com", otp: enterValue.joined())
                        print(vm.loginOtpResponse.data.token)
                        //TODO: Navigate to Main if otp valid
                        if(vm.loginOtpResponse.data.token != nil){
                            print(vm.loginOtpResponse.data.token)
                            userToken = vm.loginOtpResponse.data.token
                        }
                    }
                }) {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(10.0)
                        .padding(.bottom, 24)
                        .padding(.top, 20)
                }
                Spacer()
                CircleProgress()
                Spacer()
                Text("We sent 4 digit code to email")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                HStack {
                    Image("LogoHorizontal")
                        .resizable()
                        .frame(width: 130, height: 42)
                        .padding(.bottom, 20)
                }
            }
        }
        .background(
            NavigationLink(
                destination: MainView(),
                isActive: $vm.isOtpVerified,
                label: {
                    EmptyView()
                })
        )
    }
}

struct OtpView_Previews: PreviewProvider {
    static var previews: some View {
        OtpView(numberOfFields: 4)
    }
}
