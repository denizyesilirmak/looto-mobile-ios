//
//  HomeView.swift
//  Looto
//
//  Created by deniz.yesilirmak on 6.11.2023.
//

import Foundation

import SwiftUI

struct HomeView: View {
    @StateObject var vm = BalanceViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: Color.accentColor, location: 0),
                Gradient.Stop(color: .black, location: 0.55),
            ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                Header(vm: vm)
                GameCarousel()
                DrawCarousel()
                Spacer()
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
