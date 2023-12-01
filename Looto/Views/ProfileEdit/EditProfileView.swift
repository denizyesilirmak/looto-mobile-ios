//
//  EditProfileView.swift
//  Looto
//
//  Created by deniz.yesilirmak on 30.11.2023.
//

import Foundation

import SwiftUI

struct EditProfileView: View {
    @State var name = ""
    @State var lastname = ""
    @State var email = ""
    @State var phone = ""
    @State var city = ""

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
                    TextField("Enter your email", text: $email)
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
            }
            .padding()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
