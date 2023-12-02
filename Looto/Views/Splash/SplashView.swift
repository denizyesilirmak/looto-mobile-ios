//
//  SplashView.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.08.2023.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
    //scale animation
    @State var scale: CGFloat = 1.0

    var body: some View {
        NavigationView {
            ZStack{
                Image("BackgroundImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 10)
                    .padding(-30)   
                Image("LogoImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .offset(x: 10, y: -10)
                    .scaleEffect(scale, anchor: .center)
                    .onAppear {
                        //animation with scale delay
                        withAnimation(Animation.easeOut(duration: 2.3).delay(1)) {
                            scale = 300
                        }
                    }
                NavigationLink(destination: MainView(), isActive: $isActive) {
                    EmptyView()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isActive.toggle()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
