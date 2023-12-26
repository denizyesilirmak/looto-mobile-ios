//
//  RegisterView.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.08.2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var registerViewModel = RegisterViewModel()
    @State private var toast: Toast? = nil

    @State var email: String = ""
    @State var name: String = ""
    @State var lastname: String = ""
    @State var phone: String = ""
    @State var city: String = ""
    @State var value: CGFloat = 0
    @State var birthday = Date()

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
                    CustomCityPicker(selectedCityId: $city)
                    CustomDatePicker(selectedDate: $birthday)
                    Button(action: {

                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "dd/MM/yyyy"
                        let dateString = dateFormatter.string(from: birthday)

                        Task {

                            if(name.isEmpty || lastname.isEmpty || phone.isEmpty || city.isEmpty || dateString.isEmpty){
                                toast = Toast(style: .error, message: "Please fill all fields", duration: 3)
                                return
                            }
                            else{
                                await registerViewModel.register(email: email, name: name, lastname: lastname, phone: phone, city: city, birthday: dateString)
                                if registerViewModel.hasError {
                                    print("error")
                                    toast = Toast(style: .error, message: registerViewModel.errorMessage, duration: 3)
                                }
                                else{
                                    toast = Toast(style: .success, message: "Register success", duration: 3)
                                }
                            }
                        }
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
        .toastView(toast: $toast)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
