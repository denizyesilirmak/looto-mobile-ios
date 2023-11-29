//
//  ResultView.swift
//  Looto
//
//  Created by deniz.yesilirmak on 29.11.2023.
//

import Foundation

import SwiftUI

struct ResultView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: Color.accentColor, location: 0),
                Gradient.Stop(color: .black, location: 0.55),
            ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {

            }
            .padding()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
