//
//  ContentView.swift
//  Shared
//
//  Created by sxxrxm on 2021/08/27.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var userInfo = UserInfo()
    
    var body: some View {
        NavigationView{
            SettingsScreen()
        }
        .environmentObject(userInfo)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
