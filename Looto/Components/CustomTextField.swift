//
//  CustomTextField.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.08.2023.
//

import SwiftUI

struct CustomTextField: View {
    @State var label: String = "Label"
    @State var placeholder: String = "Placeholder"
    @State var iconName: String = "person"
    @Binding var content: String
    @State var isEmail: Bool = false
    @State var isPhone: Bool = false
    @State var hasError: Bool = false
    
    var body: some View {
        VStack {
            Text(label)
                .foregroundColor(Color.white)
                .font(.system(size: 16, weight: .bold, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(.secondary)
                TextField(placeholder,
                          text: $content).textCase(.lowercase).keyboardType(.emailAddress)
                              .textInputAutocapitalization(.never)
            }   .padding()
                .background(Rectangle().fill(Color.white).cornerRadius(10))
        }
        .padding(0)
    }
}

//preview component on black background

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            CustomTextField(label: "Email", iconName: "person", content: .constant(""))
        }
    }
}
