//
//  GameView.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.11.2023.
//

import Foundation

import SwiftUI

struct GameView: View {
    @State var numberCount: Int = 50
    @StateObject var vm = BalanceViewModel()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: Color.accentColor, location: 0),
                Gradient.Stop(color: .black, location: 0.55),
            ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                Header(vm: vm)
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 6), spacing: 10) {
                        ForEach(0..<numberCount) { number in
                            NumberBall(number: number + 1)
                        }
                    }   
                    Spacer()
            }
            .padding()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}


