//
//  ContentView.swift
//  Looto
//
//  Created by deniz.yesilirmak on 15.08.2023.
//

import SwiftUI

//screens: login, register


struct ContentView: View {
    var body: some View {
        NavigationStack {
            //MainView()
            //HomeView()
            SplashView()
            //LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
