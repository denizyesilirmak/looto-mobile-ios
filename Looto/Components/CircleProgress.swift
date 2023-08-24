//
//  CircleProgress.swift
//  Looto
//
//  Created by deniz.yesilirmak on 5.11.2023.
//

import Foundation

import SwiftUI

struct CircleProgress: View {
    @State var progress: CGFloat = 120
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body : some View {
        ZStack {
            Text("\(Int(progress))")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(.accentColor)
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 10)
                .frame(width: 100, height: 100)
            Circle()
                .trim(from: 0, to: progress / 120)
                .stroke(Color.accentColor, lineWidth: 10)
                .frame(width: 100, height: 100)
                .animation(.linear(duration: 1))
        }
        .onReceive(timer) { _ in
            if progress > 0 {
                progress -= 1
            }
        }

    }
}

struct CircleProgress_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgress()
    }
}