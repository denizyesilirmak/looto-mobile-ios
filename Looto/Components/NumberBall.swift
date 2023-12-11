//
//  NumberBall.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.11.2023.
//

import Foundation

import SwiftUI

struct NumberBall: View {
    let number: Int
    var alwaysPurple: Bool
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        Text("\(number)")
            .frame(width: 32, height: 32)
            .background(alwaysPurple ? Color.purple : viewModel.selectedNumbers.contains(number) ? Color.gray : Color.purple)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: viewModel.selectedNumbers.contains(number) ? 3 : 0)
            )
            .onTapGesture {
                viewModel.selectNumber(number)
            }
    }
}
