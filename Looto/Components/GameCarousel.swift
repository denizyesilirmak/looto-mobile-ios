//
//  GameCarousel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 6.11.2023.
//

import Foundation

import SwiftUI

struct GameCarousel: View {
    @StateObject var vm = GameCarouselViewModel()
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(vm.games, id: \.self) { game in
                        NavigationLink(destination: GameView(numberCount: game.maximumNumber)) {
                            ZStack {
                            AsyncImage(url: URL(string: game.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 300, height: 180)
                            Text(game.name)
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                        }
                        .padding(0)
                        .cornerRadius(10)
                        }
                    }
                }
                .padding(10)
            }
        }
        .task {
            await vm.getGames()
        }
    }
}

struct GameCarousel_Previews: PreviewProvider {
    static var previews: some View {
        GameCarousel()
    }
}
