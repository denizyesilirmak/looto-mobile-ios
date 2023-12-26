//
//  CustomCityPicker.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.08.2023.
//

import SwiftUI

struct CustomCityPicker: View {
    @StateObject var vm = CitiesViewModel()
    @Binding var selectedCityId: String

    
    var body: some View {
        VStack {
            Text("City")
                .foregroundColor(Color.white)
                .font(.system(size: 16, weight: .bold, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)


            Picker(selection: $vm.selectedCityId, label: Text("City")) {
                ForEach(vm.cities, id: \.self) { city in
                    Text(city.name)
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .tag(city.id)
                }
            }
            .onChange(of: vm.selectedCityId) { value in
                print("selectedCityId: \(value)")
                selectedCityId = value
            }
            .pickerStyle(MenuPickerStyle())
            .background(Color.white)
            .cornerRadius(10.0)
            .frame(maxWidth: .infinity)
            .cornerRadius(10.0)
            .padding(.top, 10)
            .padding(.bottom, 10)
            .background(Color.white)
            .cornerRadius(10.0)
        }
        .padding(0)
        .onAppear {
            Task {
                await vm.getCities()
            }
        }
    }
}

struct CustomCityPicker_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            CustomCityPicker(selectedCityId: .constant(""))
        }
    }
}
