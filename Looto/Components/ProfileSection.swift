//
//  ProfileEdit.swift
//  Looto
//
//  Created by deniz.yesilirmak on 30.11.2023.
//

import Foundation

import SwiftUI

struct UserPropertySection: View {
    @Binding var label: String?
    @Binding var value: String?

    var body: some View {
        VStack {
            HStack {
                // label and value on single line
                Text(label ?? "")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(value ?? "")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 6, trailing: 10))
        }
    }
}

struct ProfileSection: View {
    
    @StateObject var vm = EditProfileViewModel()
    
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
            
            Spacer()

            VStack {
                UserPropertySection(label: .constant("Name"), value: .constant(vm.profile?.name ?? ""))
                UserPropertySection(label: .constant("Last Name"), value: .constant(vm.profile?.lastName ?? ""))
                UserPropertySection(label: .constant("Email"), value: .constant(vm.profile?.email ?? ""))
                UserPropertySection(label: .constant("Phone"), value: .constant(vm.profile?.phoneNumber ?? ""))
                UserPropertySection(label: .constant("City"), value: .constant(vm.profile?.cityID ?? ""))
            }
            
            Spacer()
            
        }
        .onAppear {
            Task {
                await vm.fetchProfile()
            }
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
