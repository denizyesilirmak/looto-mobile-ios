//
//  RegisterView.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.08.2023.
//

import SwiftUI

struct RegisterView: View {
    @State var email: String = ""
    @State var name: String = ""
    @State var lastname: String = ""
    @State var phone: String = ""

    @State var value: CGFloat = 0

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: Color.accentColor, location: 0),
                Gradient.Stop(color: .black, location: 0.55),
            ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    CustomTextField(label: "Email", placeholder: "Enter your email", iconName: "mail", content: $email, isEmail: true)
                    CustomTextField(label: "Name", placeholder: "Enter your name",  iconName: "person", content: $name, hasError: true)
                    CustomTextField(label: "Lastname", placeholder: "Enter your lastname", iconName: "person", content: $lastname)
                    CustomTextField(label: "Phone", placeholder: "Enter your phone", iconName: "phone", content: $phone, isPhone: true)
                    CustomCityPicker()
                    CustomDatePicker()
                    Button(action: {
                        print("Register tapped!")
                    }) {
                        Text("Register")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(10.0)
                            .padding(.bottom, 24)
                            .padding(.top, 20)
                    }
                    NavigationLink(
                        destination: LoginView(),
                        label: {
                            Text("Already have an account? Login")
                                .font(.system(size: 14, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        })
                }
                .padding(.leading, 26)
                .padding(.trailing, 26)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
