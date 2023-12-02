//
//  ResultView.swift
//  Looto
//
//  Created by deniz.yesilirmak on 29.11.2023.
//

import Foundation

import SwiftUI

struct ResultView: View {
    @State var ticketCode: String = ""

    func checkTicket() {
        print("check ticket")
        if(ticketCode.count == 0) {
            let alert = UIAlertController(title: "Error", message: "Please enter a ticket code", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                print("tapped ok")
            }))
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: Color.accentColor, location: 0),
                Gradient.Stop(color: .black, location: 0.55),
            ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                TextField("Ticket Code", text: $ticketCode)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                Button(action: {
                    checkTicket()
                }, label: {
                    Text("Check")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .frame(width: 130, height: 50)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
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
