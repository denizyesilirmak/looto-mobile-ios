//
//  DrawCarousel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 16.11.2023.
//

import Foundation

import SwiftUI

struct DrawCarousel: View {
    @StateObject var vm = DrawsCarouselViewModel()
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(vm.draws) { draw in
                        ZStack {
                            AsyncImage(url: URL(string: draw.game.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 300, height: 180)
                            VStack {
                                Text(draw.game.name)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                .background(.black)
                                Text("Prize: \(draw.game.prize)")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                .background(.black)
                                Text("Prize: \(draw.createdAt)")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                .background(.black)
                            }
                        }
                    }
                }
                .padding(10)
            }
        }
        .task {
            if(vm.draws.count == 0){
                await vm.getRecentDraws()
            }
        }
    }
}

struct DrawCarousel_Previews: PreviewProvider {
    static var previews: some View {
        DrawCarousel()
    }
}
