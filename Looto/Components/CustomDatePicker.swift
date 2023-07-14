//
//  CustomDatePicker.swift
//  Looto
//
//  Created by deniz.yesilirmak on 16.08.2023.
//

import SwiftUI

struct CustomDatePicker: View {
    var body: some View {
        VStack {
            Text("Birthday")
                .foregroundColor(Color.white)
                .font(.system(size: 16, weight: .bold, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
            DatePicker("Birthday", selection: .constant(Date()), displayedComponents: .date)
                .colorScheme(.dark)
                .labelsHidden()
                .padding(.top, 12)
                .padding(.bottom, 12)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.white.opacity(1))
                .cornerRadius(10)
        }
        .padding(2)
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePicker()
            .background(Color.green)
    }
}
