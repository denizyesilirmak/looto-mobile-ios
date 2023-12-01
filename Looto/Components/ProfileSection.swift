//
//  ProfileEdit.swift
//  Looto
//
//  Created by deniz.yesilirmak on 30.11.2023.
//

import Foundation

import SwiftUI

struct UserPropertySection: View {
    @State var value: String?
    @State var label: String?

    var body: some View {
        VStack {
            HStack {
                Text("\(label ?? ""): \(value ?? "")")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 6, trailing: 10))
        }
    }
}

struct ProfileSection: View {
    
    var body: some View {
        VStack {
            NavigationLink(destination: EditProfileView()) {
                HStack {
                    Spacer()
                    Text("Edit Profile")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                    .cornerRadius(10)
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                }
            }

            UserPropertySection(value: "Deniz", label: "Name")
            UserPropertySection(value: "Yesilirmak", label: "Surname")
            UserPropertySection(value: "dnzyslrmk@gmail.com", label: "Email")
            UserPropertySection(value: "5306156145", label: "Phone")
            UserPropertySection(value: "Zonguldak", label: "City")
            UserPropertySection(value: "11/23/31", label: "Birtday")
        }
    }
}

struct ProfileSection_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: Color.accentColor, location: 0),
                Gradient.Stop(color: .black, location: 0.55),
            ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                ProfileSection()
            }
            .padding()
        }
    }
}
