//
//  DrawCarousel.swift
//  Looto
//
//  Created by deniz.yesilirmak on 16.11.2023.
//

import Foundation

import SwiftUI

func formatStringDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let newDate = dateFormatter.date(from: date)
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy")
        return dateFormatter.string(from: newDate!)
}

struct DrawCarousel: View {
    @StateObject var vm = DrawsCarouselViewModel()
    @State var opacity: CGFloat = 0
    
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
                                Text("\(formatStringDate(date: draw.createdAt))")
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .padding(10)
                                    .foregroundColor(.white)
                                    .frame(width: 300, height: 180, alignment: .bottomLeading)
                            }
                        }
                    }
                }
                .padding(10)
                .opacity(opacity)
            }
        }
        .task {
            if(vm.draws.count == 0){
                await vm.getRecentDraws()
            }
        }
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2.3).delay(1)) {
                opacity = 1.0
            }
        }
    }
}

struct DrawCarousel_Previews: PreviewProvider {
    static var previews: some View {
        DrawCarousel()
    }
}
