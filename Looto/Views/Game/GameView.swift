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
    @State var gameId: String = "testid"
    @State var gameName: String = "Game Name"
    @StateObject var vm = BalanceViewModel()

    @State var rows: [[Int]?] = [[1,2,3,5,6]]
    
    @StateObject var viewModel = GameViewModel()
    
    // the grid layout for selected numbers
    let selectedColumns = Array(repeating: GridItem(.flexible()), count: 5)
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: Color.accentColor, location: 0),
                Gradient.Stop(color: .black, location: 0.55),
            ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                // The grid of numbers
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 6)) {
                        ForEach(1...90, id: \.self) { number in
                            NumberBall(number: number, alwaysPurple: false, viewModel: viewModel)
                        }
                    }
                }
                
                Divider()
                    .background(Color.white)
                
                // the selected numbers in a 6x6 grid
                LazyVGrid(columns: selectedColumns) {
                    ForEach(viewModel.selectedNumbersChunks, id: \.self) { chunk in
                        ForEach(chunk, id: \.self) { number in
                            NumberBall(number: number, alwaysPurple: true, viewModel: viewModel)
                        }
                        
                        if(chunk.count == 5) {
                            ZStack(alignment: .trailing) {
                                Text("Ready")
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.bold)
                            }
                            .frame(width: 20, height: 48)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top)
                
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


