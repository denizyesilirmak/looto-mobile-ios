//
//  EditProfileView.swift
//  Looto
//
//  Created by deniz.yesilirmak on 30.11.2023.
//

import Foundation

import SwiftUI

struct EditProfileView: View {
    @StateObject var vm = EditProfileViewModel()
    @StateObject var balanceVm = BalanceViewModel()
    @StateObject var cityVM = CitiesViewModel()
    @State var name = ""
    @State var lastname = ""
    @State var email = ""
    @State var phone = ""
    @State var city = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: Color.accentColor, location: 0),
                Gradient.Stop(color: .black, location: 0.55),
            ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Text("Name")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Enter your name", text: $name)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 6, trailing: 0))
                    Text("Last Name")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Enter your last name", text: $lastname)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 6, trailing: 0))
                    Text("Email")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Enter your email", text: .constant(email))
                        .foregroundColor(.gray)
                        .disabled(true)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 6, trailing: 0))
                    Text("Phone")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Enter your phone", text: $phone)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 6, trailing: 0))
                    Text("City")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Enter your city", text: $city)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 6, trailing: 0))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                Button(action: {
                    Task {
                        if(name.isEmpty || lastname.isEmpty || phone.isEmpty || city.isEmpty) {
                            return
                        }
                        await vm.updateProfile(name: name, lastName: lastname, phone: phone, cityId: city)
                    }
                }, label: {
                    HStack {
                        Text("Submit")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                })
                Spacer()
            }
            .padding()
        }
        .task {
            await vm.fetchProfile()
            
            name = vm.profile?.name ?? ""
            lastname = vm.profile?.lastName ?? ""
            email = vm.profile?.email ?? ""
            phone = vm.profile?.phoneNumber ?? ""
            city = vm.profile?.cityID ?? ""
        }
        .onChange(of: vm.profileUpdated, perform: { value in
            if value {
                self.presentationMode.wrappedValue.dismiss()
            }
        })
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
