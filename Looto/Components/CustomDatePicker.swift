//
//  CustomDatePicker.swift
//  Looto
//
//  Created by deniz.yesilirmak on 16.08.2023.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var selectedDate: Date

    var body: some View {
        VStack {
            Text("Birthday")
                .foregroundColor(Color.white)
                .font(.system(size: 16, weight: .bold, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
            //Birthday picker with center alignment
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                .labelsHidden()
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 16)
                .padding(8)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.top, 4)
        }
        .padding(2)
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePicker(selectedDate: .constant(Date()))
            .background(Color.green)
    }
}
