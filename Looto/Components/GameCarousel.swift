//
//  GameCarousel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 6.11.2023.
//

import Foundation

import SwiftUI

struct GameCarousel: View {
    @StateObject var vm = GameViewModel()
    @State var opacity: CGFloat = 0
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(vm.games, id: \.self) { game in
                        NavigationLink(destination: GameView(numberCount: game.maximumNumber, gameId: game.id, gameName: game.name)) {
                            ZStack {
                            AsyncImage(url: URL(string: game.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 300, height: 180)
                                Text("\(game.prize) cr")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .padding(10)
                                .frame(width: 300, height: 180, alignment: .bottomLeading)
                        }
                        .padding(0)
                        .cornerRadius(10)
                        }
                    }
                }
                .padding(10)
                .opacity(opacity)
            }
        }
        .task {
            if(vm.games.count == 0) {
                await vm.getGames()
            }
        }
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2.3).delay(0.5)) {
                opacity = 1.0
            }
        }
    }
}

struct GameCarousel_Previews: PreviewProvider {
    static var previews: some View {
        GameCarousel()
    }
}
