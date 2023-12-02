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
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(width: 36, height: 36)
                .background(Color.accentColor)
                .clipShape(Circle())
                .foregroundColor(.white)
                .padding(.trailing, 4)
        }
    }
}

struct NumberBall_Previews: PreviewProvider {
    static var previews: some View {
        NumberBall()
    }
}
