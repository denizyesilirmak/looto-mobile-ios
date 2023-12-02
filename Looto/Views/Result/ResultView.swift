//
//  ResultView.swift
//  Looto
//
//  Created by deniz.yesilirmak on 29.11.2023.
//

import Foundation

import SwiftUI



struct TicketListItem: View {
    var body: some View {
        HStack {
            Text("12/12/23 12:34")
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .frame(width: 120)
                .padding(4)
                .cornerRadius(10)
            Spacer()
            Text("Fortunas")
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .frame(width: 100)
                .padding(4)
                .cornerRadius(10)
            Spacer()
            Text("Lost")
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .frame(width: 80)
                .padding(4)
                .background(.red)
                .cornerRadius(10)
        }
        .padding(10)
    }
}

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
                Text("Check winning status of your ticket")
                    .foregroundColor(.white)
                    .padding(10)
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
                ZStack {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.white)
                        .padding(.top, 0)
                    Text("Your Tickets")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal, 10)
                        .background(.black)
                        .padding(20)
                }
                ScrollView {
                    VStack {
                        TicketListItem()
                        TicketListItem()
                        TicketListItem()
                    }
                }
                
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
