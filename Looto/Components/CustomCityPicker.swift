//
//  CustomCityPicker.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.08.2023.
//

import SwiftUI

struct CustomCityPicker: View {
    @StateObject var vm = CitiesViewModel()
    
    var body: some View {
        VStack {
            Text("City")
                .foregroundColor(Color.white)
                .font(.system(size: 16, weight: .bold, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)

            Picker(selection: .constant(1), label: Text("City")
            ) {
                if(vm.cities.count == 0) {
                    Text("Loading...").tag(1)
                }
                ForEach(vm.cities) {city in
                    Text(city.name).tag(city._id)
                }
            }
            .task() {
                await vm.getCities()
            }
            .frame(maxWidth: .infinity)
            .cornerRadius(10.0)
            .padding(.top, 10)
            .padding(.bottom, 10)
            .background(Color.white)
            .cornerRadius(10.0)
        }
        .padding(0)
    }
}

struct CustomCityPicker_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            CustomCityPicker()
        }
    }
}
