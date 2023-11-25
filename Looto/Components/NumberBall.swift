//
//  NumberBall.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.11.2023.
//

import Foundation

import SwiftUI

struct NumberBall: View {
    @State var number: Int = 0
    
    
    var body: some View {
        Button(action: {
            print("Button tapped")
        }) {
            Text("\(number)")
                .frame(width: 40, height: 40)
                .background(Color.accentColor)
                .clipShape(Circle())
                .foregroundColor(.white)
                .padding(.trailing, 10)
        }
    }
}

struct NumberBall_Previews: PreviewProvider {
    static var previews: some View {
        NumberBall()
    }
}
