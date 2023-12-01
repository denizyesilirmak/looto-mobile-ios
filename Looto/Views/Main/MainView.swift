//
//  HomeView.swift
//  Looto
//
//  Created by deniz.yesilirmak on 6.11.2023.
//

import Foundation

import SwiftUI

struct MainView: View {
    @StateObject var vm = BalanceViewModel()
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .toolbarBackground(
                                .blue, for: .navigationBar, .tabBar)
                .accentColor(.red)
            ResultView()
                .tabItem {
                    Label("Result", systemImage: "magnifyingglass")
                }
                .toolbarBackground(
                                .blue, for: .navigationBar, .tabBar)
            ProfileView(vm: vm)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .toolbarBackground(
                                .blue, for: .navigationBar, .tabBar)
                .accentColor(.blue)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
